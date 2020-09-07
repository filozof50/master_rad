//===-- Searcher.cpp ------------------------------------------------------===//
//
//                     The KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "Searcher.h"

#include "CoreStats.h"
#include "Executor.h"
#include "PTree.h"
#include "StatsTracker.h"

#include "klee/ExecutionState.h"
#include "klee/MergeHandler.h"
#include "klee/Statistics.h"
#include "klee/Internal/Module/InstructionInfoTable.h"
#include "klee/Internal/Module/KInstruction.h"
#include "klee/Internal/Module/KModule.h"
#include "klee/Internal/ADT/DiscretePDF.h"
#include "klee/Internal/ADT/RNG.h"
#include "klee/Internal/Support/ModuleUtil.h"
#include "klee/Internal/System/Time.h"
#include "klee/Internal/Support/ErrorHandling.h"
#include "llvm/IR/CallSite.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/CommandLine.h"

#include <cassert>
#include <climits>
#include <cmath>
#include <fstream>
#include <random>

using namespace klee;
using namespace llvm;


namespace klee {
  extern RNG theRNG;
}

Searcher::~Searcher() {
}

/// MY SEARCHER
MySearcher::MySearcher(double memory_part, Executor &executor)
    : exe(executor)
{
    runningBFS = true;
    m_memory_part = memory_part;
}

ExecutionState &MySearcher::selectState()
{
    if (runningBFS) {
        return *BFSStates.front();
    }
    else {
        if (DFSStates.size() == 0) {
            instructions = stats::instructions;
            int index = find_state_index();
            DFSStates.push_back(BFSStates[index]);
            auto it = BFSStates.begin();
            std::advance(it, index);
            BFSStates.erase(it);
            return *DFSStates.back();
        }

        return *DFSStates.back();
    }
}

void MySearcher::update(ExecutionState *current, const std::vector<ExecutionState *> &addedStates,
                         const std::vector<ExecutionState *> &removedStates)
{
    if (runningBFS) {
        BFSUpdate(current, addedStates, removedStates);
    }
    else {
        DFSUpdate(current, addedStates, removedStates);
    }
}

void MySearcher::DFSUpdate(ExecutionState *current,
                         const std::vector<ExecutionState *> &addedStates,
                         const std::vector<ExecutionState *> &removedStates)
{
  if (current->coveredNew)
      instructions = stats::instructions;

  DFSStates.insert(DFSStates.end(),
                addedStates.begin(),
                addedStates.end());

  for (std::vector<ExecutionState *>::const_iterator it = removedStates.begin(), ie = removedStates.end(); it != ie; ++it) {
    ExecutionState *es = *it;
    if (es == DFSStates.back()) {
      DFSStates.pop_back();
    }
    else {
          bool ok = false;

          for (std::vector<ExecutionState*>::iterator it = DFSStates.begin(),
                 ie = DFSStates.end(); it != ie; ++it) {
            if (es==*it) {
              DFSStates.erase(it);
              ok = true;
              break;
            }
          }

          (void) ok;
          assert(ok && "invalid state removed");
    }
 }

 if (stats::instructions >= instructions + 10000) {
    std::vector<ExecutionState*> states_to_remove;
    std::vector<ExecutionState*> new_DFS_states;

    for (auto it = DFSStates.begin(); it != DFSStates.end(); it++) {
//        (*it)->instsSinceCovNew >= 5000
        if ((*it)->coveredNew == false)
            states_to_remove.push_back(*it);
        else
            new_DFS_states.push_back(*it);
    }

//    DFSStates.erase(std::remove_if(DFSStates.begin(), DFSStates.end(), [](auto es){ return es->coveredNew == false; }));

    exe.remove_from_states(states_to_remove);
    DFSStates = new_DFS_states;

//    std::cout << "\n\n\n\n\nis empty: " << empty() << "\n\n\n\n\n";
//    instructions = stats::instructions;
 }
}

void MySearcher::BFSUpdate(ExecutionState *current,
                         const std::vector<ExecutionState *> &addedStates,
                         const std::vector<ExecutionState *> &removedStates) {
  // Assumption: If new states were added KLEE forked, therefore states evolved.
  // constraints were added to the current state, it evolved.

//    std::cerr << "pre " << states.size() << "\n";
  if (!addedStates.empty() && current &&
      std::find(removedStates.begin(), removedStates.end(), current) ==
          removedStates.end()) {
    auto pos = std::find(BFSStates.begin(), BFSStates.end(), current);
    assert(pos != BFSStates.end());
    BFSStates.erase(pos);
    BFSStates.push_back(current);
  }

  BFSStates.insert(BFSStates.end(),
                addedStates.begin(),
                addedStates.end());
  for (std::vector<ExecutionState *>::const_iterator it = removedStates.begin(),
                                                     ie = removedStates.end();
       it != ie; ++it) {
    ExecutionState *es = *it;
    if (es == BFSStates.front()) {
      BFSStates.erase(BFSStates.begin());
    } else {
      bool ok = false;

      for (auto it = BFSStates.begin(),
             ie = BFSStates.end(); it != ie; ++it) {
        if (es==*it) {
          BFSStates.erase(it);
          ok = true;
          break;
        }
      }

      (void) ok;
      assert(ok && "invalid state removed");
    }
  }
}

double MySearcher::get_memory_part() const
{
    return m_memory_part;
}

bool MySearcher::is_running_BFS() const
{
    return runningBFS;
}

int MySearcher::find_state_index()
{
    ExecutionState *es = *BFSStates.begin();

    uint64_t min_distance;

    min_distance = computeMinDistToUncovered(es->pc, es->stack.back().minDistToUncoveredOnReturn);

    int index = 0;

    auto start = BFSStates.begin();
    auto begin = BFSStates.begin();
    auto end = BFSStates.end();

    std::advance(begin, 1);

    uint64_t current_state;

    while (begin != end) {
        current_state = computeMinDistToUncovered((*begin)->pc, (*begin)->stack.back().minDistToUncoveredOnReturn);

        if (current_state < min_distance) {
            min_distance = current_state;
            index = distance(start, begin);
        }

        begin++;
    }

    return index;
}

void MySearcher::changeAlgorithm()
{
    exe.clear_states();
    runningBFS = false;
}


/// END MY SEARCHER
///

ExecutionState &DFSSearcher::selectState() {
  return *states.back();
}

void DFSSearcher::update(ExecutionState *current,
                         const std::vector<ExecutionState *> &addedStates,
                         const std::vector<ExecutionState *> &removedStates) {
//    std::cerr << "Broj stanja pre " << states.size() << "\n";
  states.insert(states.end(),
                addedStates.begin(),
                addedStates.end());
  for (std::vector<ExecutionState *>::const_iterator it = removedStates.begin(),
                                                     ie = removedStates.end();
       it != ie; ++it) {
    ExecutionState *es = *it;
    if (es == states.back()) {
      states.pop_back();
    } else {
      bool ok = false;

      for (std::vector<ExecutionState*>::iterator it = states.begin(),
             ie = states.end(); it != ie; ++it) {
        if (es==*it) {
          states.erase(it);
          ok = true;
          break;
        }
      }

      (void) ok;
      assert(ok && "invalid state removed");
    }
  }

//  std::cerr << "Broj stanja posle " << states.size() << "\n";
}

///

ExecutionState &BFSSearcher::selectState() {
  return *states.front();
}

void BFSSearcher::update(ExecutionState *current,
                         const std::vector<ExecutionState *> &addedStates,
                         const std::vector<ExecutionState *> &removedStates) {
  // Assumption: If new states were added KLEE forked, therefore states evolved.
  // constraints were added to the current state, it evolved.

//    std::cerr << "pre " << states.size() << "\n";
  if (!addedStates.empty() && current &&
      std::find(removedStates.begin(), removedStates.end(), current) ==
          removedStates.end()) {
    auto pos = std::find(states.begin(), states.end(), current);
    assert(pos != states.end());
    states.erase(pos);
    states.push_back(current);
  }

  states.insert(states.end(),
                addedStates.begin(),
                addedStates.end());
  for (std::vector<ExecutionState *>::const_iterator it = removedStates.begin(),
                                                     ie = removedStates.end();
       it != ie; ++it) {
    ExecutionState *es = *it;
    if (es == states.front()) {
      states.pop_front();
    } else {
      bool ok = false;

      for (std::deque<ExecutionState*>::iterator it = states.begin(),
             ie = states.end(); it != ie; ++it) {
        if (es==*it) {
          states.erase(it);
          ok = true;
          break;
        }
      }

      (void) ok;
      assert(ok && "invalid state removed");
    }
  }

//  std::cerr << "posle " << states.size() << "\n";
}

///

ExecutionState &RandomSearcher::selectState() {
  return *states[theRNG.getInt32()%states.size()];
}

void
RandomSearcher::update(ExecutionState *current,
                       const std::vector<ExecutionState *> &addedStates,
                       const std::vector<ExecutionState *> &removedStates) {
  states.insert(states.end(),
                addedStates.begin(),
                addedStates.end());
  for (std::vector<ExecutionState *>::const_iterator it = removedStates.begin(),
                                                     ie = removedStates.end();
       it != ie; ++it) {
    ExecutionState *es = *it;
    __attribute__((unused))
    bool ok = false;

    for (std::vector<ExecutionState*>::iterator it = states.begin(),
           ie = states.end(); it != ie; ++it) {
      if (es==*it) {
        states.erase(it);
        ok = true;
        break;
      }
    }
    
    assert(ok && "invalid state removed");
  }
}

///

WeightedRandomSearcher::WeightedRandomSearcher(WeightType _type)
  : states(new DiscretePDF<ExecutionState*>()),
    type(_type) {
  switch(type) {
  case Depth:
  case RP:
    updateWeights = false;
    break;
  case InstCount:
  case CPInstCount:
  case QueryCost:
  case MinDistToUncovered:
  case CoveringNew:
    updateWeights = true;
    break;
  default:
    assert(0 && "invalid weight type");
  }
}

WeightedRandomSearcher::~WeightedRandomSearcher() {
  delete states;
}

ExecutionState &WeightedRandomSearcher::selectState() {
  return *states->choose(theRNG.getDoubleL());
}

double WeightedRandomSearcher::getWeight(ExecutionState *es) {
  switch(type) {
  default:
  case Depth:
    return es->depth;
  case RP:
    return std::pow(0.5, es->depth);
  case InstCount: {
    uint64_t count = theStatisticManager->getIndexedValue(stats::instructions,
                                                          es->pc->info->id);
    double inv = 1. / std::max((uint64_t) 1, count);
    return inv * inv;
  }
  case CPInstCount: {
    StackFrame &sf = es->stack.back();
    uint64_t count = sf.callPathNode->statistics.getValue(stats::instructions);
    double inv = 1. / std::max((uint64_t) 1, count);
    return inv;
  }
  case QueryCost:
    return (es->queryCost.toSeconds() < .1) ? 1. : 1./ es->queryCost.toSeconds();
  case CoveringNew:
  case MinDistToUncovered: {
    uint64_t md2u = computeMinDistToUncovered(es->pc,
                                              es->stack.back().minDistToUncoveredOnReturn);

    double invMD2U = 1. / (md2u ? md2u : 10000);
    if (type==CoveringNew) {
      double invCovNew = 0.;
      if (es->instsSinceCovNew)
        invCovNew = 1. / std::max(1, (int) es->instsSinceCovNew - 1000);
      return (invCovNew * invCovNew + invMD2U * invMD2U);
    } else {
      return invMD2U * invMD2U;
    }
  }
  }
}

void WeightedRandomSearcher::update(
    ExecutionState *current, const std::vector<ExecutionState *> &addedStates,
    const std::vector<ExecutionState *> &removedStates) {
  if (current && updateWeights &&
      std::find(removedStates.begin(), removedStates.end(), current) ==
          removedStates.end())
    states->update(current, getWeight(current));

  for (std::vector<ExecutionState *>::const_iterator it = addedStates.begin(),
                                                     ie = addedStates.end();
       it != ie; ++it) {
    ExecutionState *es = *it;
    states->insert(es, getWeight(es));
  }

  for (std::vector<ExecutionState *>::const_iterator it = removedStates.begin(),
                                                     ie = removedStates.end();
       it != ie; ++it) {
    states->remove(*it);
  }
}

bool WeightedRandomSearcher::empty() { 
  return states->empty(); 
}

///
RandomPathSearcher::RandomPathSearcher(Executor &_executor)
  : executor(_executor) {
}

RandomPathSearcher::~RandomPathSearcher() {
}

ExecutionState &RandomPathSearcher::selectState() {
  unsigned flips=0, bits=0;
  PTreeNode *n = executor.processTree->root.get();
  while (!n->state) {
    if (!n->left) {
      n = n->right.get();
    } else if (!n->right) {
      n = n->left.get();
    } else {
      if (bits==0) {
        flips = theRNG.getInt32();
        bits = 32;
      }
      --bits;
      n = (flips&(1<<bits)) ? n->left.get() : n->right.get();
    }
  }

  return *n->state;
}

void
RandomPathSearcher::update(ExecutionState *current,
                           const std::vector<ExecutionState *> &addedStates,
                           const std::vector<ExecutionState *> &removedStates) {
}

bool RandomPathSearcher::empty() { 
  return executor.states.empty(); 
}

///

MergingSearcher::MergingSearcher(Searcher *_baseSearcher)
  : baseSearcher(_baseSearcher){}

MergingSearcher::~MergingSearcher() {
  delete baseSearcher;
}

ExecutionState& MergingSearcher::selectState() {
  assert(!baseSearcher->empty() && "base searcher is empty");

  if (!UseIncompleteMerge)
    return baseSearcher->selectState();

  // Iterate through all MergeHandlers
  for (auto cur_mergehandler: mergeGroups) {
    // Find one that has states that could be released
    if (!cur_mergehandler->hasMergedStates()) {
      continue;
    }
    // Find a state that can be prioritized
    ExecutionState *es = cur_mergehandler->getPrioritizeState();
    if (es) {
      return *es;
    } else {
      if (DebugLogIncompleteMerge){
        llvm::errs() << "Preemptively releasing states\n";
      }
      // If no state can be prioritized, they all exceeded the amount of time we
      // are willing to wait for them. Release the states that already arrived at close_merge.
      cur_mergehandler->releaseStates();
    }
  }
  // If we were not able to prioritize a merging state, just return some state
  return baseSearcher->selectState();
}

///

BatchingSearcher::BatchingSearcher(Searcher *_baseSearcher,
                                   time::Span _timeBudget,
                                   unsigned _instructionBudget) 
  : timeBudget(_timeBudget),
    instructionBudget(_instructionBudget),
    lastState(0),
    baseSearcher(_baseSearcher) {
  
}

BatchingSearcher::~BatchingSearcher() {
  delete baseSearcher;
}

ExecutionState &BatchingSearcher::selectState() {
  if (!lastState ||
      (((timeBudget.toSeconds() > 0) &&
        (time::getWallTime() - lastStartTime) > timeBudget)) ||
      ((instructionBudget > 0) &&
       (stats::instructions - lastStartInstructions) > instructionBudget)) {
    if (lastState) {
      time::Span delta = time::getWallTime() - lastStartTime;
      auto t = timeBudget;
      t *= 1.1;
      if (delta > t) {
        klee_message("increased time budget from %f to %f\n", timeBudget.toSeconds(), delta.toSeconds());
        timeBudget = delta;
      }
    }
    lastState = &baseSearcher->selectState();
    lastStartTime = time::getWallTime();
    lastStartInstructions = stats::instructions;
    return *lastState;
  } else {
    return *lastState;
  }
}

void
BatchingSearcher::update(ExecutionState *current,
                         const std::vector<ExecutionState *> &addedStates,
                         const std::vector<ExecutionState *> &removedStates) {
    if (std::find(removedStates.begin(), removedStates.end(), lastState) !=
        removedStates.end())
      lastState = 0;
    baseSearcher->update(current, addedStates, removedStates);
}

/***/

IterativeDeepeningTimeSearcher::IterativeDeepeningTimeSearcher(Searcher *_baseSearcher)
  : baseSearcher(_baseSearcher),
    time(time::seconds(1)) {
}

IterativeDeepeningTimeSearcher::~IterativeDeepeningTimeSearcher() {
  delete baseSearcher;
}

ExecutionState &IterativeDeepeningTimeSearcher::selectState() {
  ExecutionState &res = baseSearcher->selectState();
  startTime = time::getWallTime();
  return res;
}

void IterativeDeepeningTimeSearcher::update(
    ExecutionState *current, const std::vector<ExecutionState *> &addedStates,
    const std::vector<ExecutionState *> &removedStates) {

  const auto elapsed = time::getWallTime() - startTime;

  if (!removedStates.empty()) {
    std::vector<ExecutionState *> alt = removedStates;
    for (std::vector<ExecutionState *>::const_iterator
             it = removedStates.begin(),
             ie = removedStates.end();
         it != ie; ++it) {
      ExecutionState *es = *it;
      std::set<ExecutionState*>::const_iterator it2 = pausedStates.find(es);
      if (it2 != pausedStates.end()) {
        pausedStates.erase(it2);
        alt.erase(std::remove(alt.begin(), alt.end(), es), alt.end());
      }
    }    
    baseSearcher->update(current, addedStates, alt);
  } else {
    baseSearcher->update(current, addedStates, removedStates);
  }

  if (current &&
      std::find(removedStates.begin(), removedStates.end(), current) ==
          removedStates.end() &&
      elapsed > time) {
    pausedStates.insert(current);
    baseSearcher->removeState(current);
  }

  if (baseSearcher->empty()) {
    time *= 2U;
    klee_message("increased time budget to %f\n", time.toSeconds());
    std::vector<ExecutionState *> ps(pausedStates.begin(), pausedStates.end());
    baseSearcher->update(0, ps, std::vector<ExecutionState *>());
    pausedStates.clear();
  }
}

/***/

InterleavedSearcher::InterleavedSearcher(const std::vector<Searcher*> &_searchers)
  : searchers(_searchers),
    index(1) {
}

InterleavedSearcher::~InterleavedSearcher() {
  for (std::vector<Searcher*>::const_iterator it = searchers.begin(),
         ie = searchers.end(); it != ie; ++it)
    delete *it;
}

ExecutionState &InterleavedSearcher::selectState() {
  Searcher *s = searchers[--index];
  if (index==0) index = searchers.size();
  return s->selectState();
}

void InterleavedSearcher::update(
    ExecutionState *current, const std::vector<ExecutionState *> &addedStates,
    const std::vector<ExecutionState *> &removedStates) {
  for (std::vector<Searcher*>::const_iterator it = searchers.begin(),
         ie = searchers.end(); it != ie; ++it)
    (*it)->update(current, addedStates, removedStates);
}