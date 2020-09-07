//===-- UserSearcher.cpp --------------------------------------------------===//
//
//                     The KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "UserSearcher.h"

#include "Searcher.h"
#include "Executor.h"

#include "klee/Internal/Support/ErrorHandling.h"
#include "klee/MergeHandler.h"
#include "klee/Solver/SolverCmdLine.h"

#include "llvm/Support/CommandLine.h"

using namespace llvm;
using namespace klee;

namespace {
llvm::cl::OptionCategory
    SearchCat("Search options", "These options control the search heuristic.");

cl::list<Searcher::CoreSearchType> CoreSearch(
    "search",
    cl::desc("Specify the search heuristic (default=random-path interleaved "
             "with nurs:covnew)"),
    cl::values(
        clEnumValN(Searcher::BFS_DFS_SEARCHER, "bfs-dfs", "Combination of BFS and DFS"),
        clEnumValN(Searcher::DFS, "dfs", "use Depth First Search (DFS)"),
        clEnumValN(Searcher::BFS, "bfs",
                   "use Breadth First Search (BFS), where scheduling decisions "
                   "are taken at the level of (2-way) forks"),
        clEnumValN(Searcher::RandomState, "random-state",
                   "randomly select a state to explore"),
        clEnumValN(Searcher::RandomPath, "random-path",
                   "use Random Path Selection (see OSDI'08 paper)"),
        clEnumValN(Searcher::NURS_CovNew, "nurs:covnew",
                   "use Non Uniform Random Search (NURS) with Coverage-New"),
        clEnumValN(Searcher::NURS_MD2U, "nurs:md2u",
                   "use NURS with Min-Dist-to-Uncovered"),
        clEnumValN(Searcher::NURS_Depth, "nurs:depth", "use NURS with depth"),
        clEnumValN(Searcher::NURS_RP, "nurs:rp", "use NURS with 1/2^depth"),
        clEnumValN(Searcher::NURS_ICnt, "nurs:icnt",
                   "use NURS with Instr-Count"),
        clEnumValN(Searcher::NURS_CPICnt, "nurs:cpicnt",
                   "use NURS with CallPath-Instr-Count"),
        clEnumValN(Searcher::NURS_QC, "nurs:qc", "use NURS with Query-Cost")
            KLEE_LLVM_CL_VAL_END),
    cl::cat(SearchCat));

cl::opt<bool> UseIterativeDeepeningTimeSearch(
    "use-iterative-deepening-time-search",
    cl::desc(
        "Use iterative deepening time search (experimental) (default=false)"),
    cl::init(false),
    cl::cat(SearchCat));

cl::opt<bool> UseBatchingSearch(
    "use-batching-search",
    cl::desc("Use batching searcher (keep running selected state for N "
             "instructions/time, see --batch-instructions and --batch-time) "
             "(default=false)"),
    cl::init(false),
    cl::cat(SearchCat));

cl::opt<unsigned> BatchInstructions(
    "batch-instructions",
    cl::desc("Number of instructions to batch when using "
             "--use-batching-search.  Set to 0 to disable (default=10000)"),
    cl::init(10000),
    cl::cat(SearchCat));

cl::opt<std::string> BatchTime(
    "batch-time",
    cl::desc("Amount of time to batch when using "
             "--use-batching-search.  Set to 0s to disable (default=5s)"),
    cl::init("5s"),
    cl::cat(SearchCat));

cl::opt<double> MemoryPart(
    "memory-part",
    cl::desc("Part of memory after which is full, search changes Algorithm to DFS in BFS-DFS searcher"),
    cl::init(0.4),
    cl::cat(SearchCat));

cl::opt<int> InstsSinceCoveredNew(
    "memory-part",
    cl::desc("Number of instructions to remove states in BFS-DFS Searcher when DFS algorithm is active"),
    cl::init(10000),
    cl::cat(SearchCat));
} // namespace

void klee::initializeSearchOptions() {
  // default values
  if (CoreSearch.empty()) {
    if (UseMerge){
      CoreSearch.push_back(Searcher::NURS_CovNew);
      klee_warning("--use-merge enabled. Using NURS_CovNew as default searcher.");
    } else {
        CoreSearch.push_back(Searcher::NURS_MD2U);
    }
  }
}

bool klee::userSearcherRequiresMD2U() {
  return (std::find(CoreSearch.begin(), CoreSearch.end(), Searcher::NURS_MD2U) != CoreSearch.end() ||
	  std::find(CoreSearch.begin(), CoreSearch.end(), Searcher::NURS_CovNew) != CoreSearch.end() ||
	  std::find(CoreSearch.begin(), CoreSearch.end(), Searcher::NURS_ICnt) != CoreSearch.end() ||
	  std::find(CoreSearch.begin(), CoreSearch.end(), Searcher::NURS_CPICnt) != CoreSearch.end() ||
      std::find(CoreSearch.begin(), CoreSearch.end(), Searcher::NURS_QC) != CoreSearch.end());
}


Searcher *getNewSearcher(Searcher::CoreSearchType type, Executor &executor) {
  Searcher *searcher = NULL;
  switch (type) {
  case Searcher::DFS: searcher = new DFSSearcher(); std::cout << "1\n"; break;
  case Searcher::BFS: searcher = new BFSSearcher(); std::cout << "2\n"; break;
  case Searcher::RandomState: searcher = new RandomSearcher(); std::cout << "3\n"; break;
  case Searcher::RandomPath: searcher = new RandomPathSearcher(executor); std::cout << "4\n"; break;
  case Searcher::NURS_CovNew: searcher = new WeightedRandomSearcher(WeightedRandomSearcher::CoveringNew); std::cout << "5\n"; break;
  case Searcher::NURS_MD2U: searcher = new WeightedRandomSearcher(WeightedRandomSearcher::MinDistToUncovered); std::cout << "6\n"; break;
  case Searcher::NURS_Depth: searcher = new WeightedRandomSearcher(WeightedRandomSearcher::Depth); std::cout << "7\n"; break;
  case Searcher::NURS_RP: searcher = new WeightedRandomSearcher(WeightedRandomSearcher::RP); std::cout << "8\n"; break;
  case Searcher::NURS_ICnt: searcher = new WeightedRandomSearcher(WeightedRandomSearcher::InstCount); std::cout << "9\n"; break;
  case Searcher::NURS_CPICnt: searcher = new WeightedRandomSearcher(WeightedRandomSearcher::CPInstCount); std::cout << "10\n"; break;
  case Searcher::NURS_QC: searcher = new WeightedRandomSearcher(WeightedRandomSearcher::QueryCost); std::cout << "11\n";break;
  case Searcher::BFS_DFS_SEARCHER: searcher = new BFSDFSSearcher(MemoryPart, InstsSinceCoveredNew, executor); std::cout << "my searcher\n"; break;
  }

  return searcher;
}

Searcher *klee::constructUserSearcher(Executor &executor) {
  Searcher *searcher = getNewSearcher(CoreSearch[0], executor);

  if (CoreSearch.size() > 1) {
      std::cout << "DA DA DA\n";
    std::vector<Searcher *> s;
    s.push_back(searcher);

    for (unsigned i = 1; i < CoreSearch.size(); i++)
      s.push_back(getNewSearcher(CoreSearch[i], executor));

    searcher = new InterleavedSearcher(s);
  }

  if (UseBatchingSearch) {
    searcher = new BatchingSearcher(searcher, time::Span(BatchTime),
                                    BatchInstructions);
  }

  if (UseIterativeDeepeningTimeSearch) {
    searcher = new IterativeDeepeningTimeSearcher(searcher);
  }

  if (UseMerge) {
    if (std::find(CoreSearch.begin(), CoreSearch.end(), Searcher::RandomPath) !=
        CoreSearch.end()) {
      klee_error("use-merge currently does not support random-path, please use "
                 "another search strategy");
    }

    auto *ms = new MergingSearcher(searcher);
    executor.setMergingSearcher(ms);

    searcher = ms;
  }

  llvm::raw_ostream &os = executor.getHandler().getInfoStream();

  os << "BEGIN searcher description\n";
  searcher->printName(os);
  os << "END searcher description\n";

  return searcher;
}
