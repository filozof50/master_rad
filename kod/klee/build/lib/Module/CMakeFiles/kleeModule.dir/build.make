# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/strahinja/repo/klee

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/strahinja/repo/klee/build

# Include any dependencies generated for this target.
include lib/Module/CMakeFiles/kleeModule.dir/depend.make

# Include the progress variables for this target.
include lib/Module/CMakeFiles/kleeModule.dir/progress.make

# Include the compile flags for this target's objects.
include lib/Module/CMakeFiles/kleeModule.dir/flags.make

lib/Module/CMakeFiles/kleeModule.dir/Checks.cpp.o: lib/Module/CMakeFiles/kleeModule.dir/flags.make
lib/Module/CMakeFiles/kleeModule.dir/Checks.cpp.o: ../lib/Module/Checks.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/strahinja/repo/klee/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object lib/Module/CMakeFiles/kleeModule.dir/Checks.cpp.o"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/kleeModule.dir/Checks.cpp.o -c /home/strahinja/repo/klee/lib/Module/Checks.cpp

lib/Module/CMakeFiles/kleeModule.dir/Checks.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kleeModule.dir/Checks.cpp.i"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/strahinja/repo/klee/lib/Module/Checks.cpp > CMakeFiles/kleeModule.dir/Checks.cpp.i

lib/Module/CMakeFiles/kleeModule.dir/Checks.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kleeModule.dir/Checks.cpp.s"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/strahinja/repo/klee/lib/Module/Checks.cpp -o CMakeFiles/kleeModule.dir/Checks.cpp.s

lib/Module/CMakeFiles/kleeModule.dir/FunctionAlias.cpp.o: lib/Module/CMakeFiles/kleeModule.dir/flags.make
lib/Module/CMakeFiles/kleeModule.dir/FunctionAlias.cpp.o: ../lib/Module/FunctionAlias.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/strahinja/repo/klee/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object lib/Module/CMakeFiles/kleeModule.dir/FunctionAlias.cpp.o"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/kleeModule.dir/FunctionAlias.cpp.o -c /home/strahinja/repo/klee/lib/Module/FunctionAlias.cpp

lib/Module/CMakeFiles/kleeModule.dir/FunctionAlias.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kleeModule.dir/FunctionAlias.cpp.i"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/strahinja/repo/klee/lib/Module/FunctionAlias.cpp > CMakeFiles/kleeModule.dir/FunctionAlias.cpp.i

lib/Module/CMakeFiles/kleeModule.dir/FunctionAlias.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kleeModule.dir/FunctionAlias.cpp.s"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/strahinja/repo/klee/lib/Module/FunctionAlias.cpp -o CMakeFiles/kleeModule.dir/FunctionAlias.cpp.s

lib/Module/CMakeFiles/kleeModule.dir/InstructionInfoTable.cpp.o: lib/Module/CMakeFiles/kleeModule.dir/flags.make
lib/Module/CMakeFiles/kleeModule.dir/InstructionInfoTable.cpp.o: ../lib/Module/InstructionInfoTable.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/strahinja/repo/klee/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object lib/Module/CMakeFiles/kleeModule.dir/InstructionInfoTable.cpp.o"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/kleeModule.dir/InstructionInfoTable.cpp.o -c /home/strahinja/repo/klee/lib/Module/InstructionInfoTable.cpp

lib/Module/CMakeFiles/kleeModule.dir/InstructionInfoTable.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kleeModule.dir/InstructionInfoTable.cpp.i"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/strahinja/repo/klee/lib/Module/InstructionInfoTable.cpp > CMakeFiles/kleeModule.dir/InstructionInfoTable.cpp.i

lib/Module/CMakeFiles/kleeModule.dir/InstructionInfoTable.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kleeModule.dir/InstructionInfoTable.cpp.s"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/strahinja/repo/klee/lib/Module/InstructionInfoTable.cpp -o CMakeFiles/kleeModule.dir/InstructionInfoTable.cpp.s

lib/Module/CMakeFiles/kleeModule.dir/InstructionOperandTypeCheckPass.cpp.o: lib/Module/CMakeFiles/kleeModule.dir/flags.make
lib/Module/CMakeFiles/kleeModule.dir/InstructionOperandTypeCheckPass.cpp.o: ../lib/Module/InstructionOperandTypeCheckPass.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/strahinja/repo/klee/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object lib/Module/CMakeFiles/kleeModule.dir/InstructionOperandTypeCheckPass.cpp.o"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/kleeModule.dir/InstructionOperandTypeCheckPass.cpp.o -c /home/strahinja/repo/klee/lib/Module/InstructionOperandTypeCheckPass.cpp

lib/Module/CMakeFiles/kleeModule.dir/InstructionOperandTypeCheckPass.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kleeModule.dir/InstructionOperandTypeCheckPass.cpp.i"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/strahinja/repo/klee/lib/Module/InstructionOperandTypeCheckPass.cpp > CMakeFiles/kleeModule.dir/InstructionOperandTypeCheckPass.cpp.i

lib/Module/CMakeFiles/kleeModule.dir/InstructionOperandTypeCheckPass.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kleeModule.dir/InstructionOperandTypeCheckPass.cpp.s"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/strahinja/repo/klee/lib/Module/InstructionOperandTypeCheckPass.cpp -o CMakeFiles/kleeModule.dir/InstructionOperandTypeCheckPass.cpp.s

lib/Module/CMakeFiles/kleeModule.dir/IntrinsicCleaner.cpp.o: lib/Module/CMakeFiles/kleeModule.dir/flags.make
lib/Module/CMakeFiles/kleeModule.dir/IntrinsicCleaner.cpp.o: ../lib/Module/IntrinsicCleaner.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/strahinja/repo/klee/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object lib/Module/CMakeFiles/kleeModule.dir/IntrinsicCleaner.cpp.o"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/kleeModule.dir/IntrinsicCleaner.cpp.o -c /home/strahinja/repo/klee/lib/Module/IntrinsicCleaner.cpp

lib/Module/CMakeFiles/kleeModule.dir/IntrinsicCleaner.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kleeModule.dir/IntrinsicCleaner.cpp.i"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/strahinja/repo/klee/lib/Module/IntrinsicCleaner.cpp > CMakeFiles/kleeModule.dir/IntrinsicCleaner.cpp.i

lib/Module/CMakeFiles/kleeModule.dir/IntrinsicCleaner.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kleeModule.dir/IntrinsicCleaner.cpp.s"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/strahinja/repo/klee/lib/Module/IntrinsicCleaner.cpp -o CMakeFiles/kleeModule.dir/IntrinsicCleaner.cpp.s

lib/Module/CMakeFiles/kleeModule.dir/KInstruction.cpp.o: lib/Module/CMakeFiles/kleeModule.dir/flags.make
lib/Module/CMakeFiles/kleeModule.dir/KInstruction.cpp.o: ../lib/Module/KInstruction.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/strahinja/repo/klee/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object lib/Module/CMakeFiles/kleeModule.dir/KInstruction.cpp.o"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/kleeModule.dir/KInstruction.cpp.o -c /home/strahinja/repo/klee/lib/Module/KInstruction.cpp

lib/Module/CMakeFiles/kleeModule.dir/KInstruction.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kleeModule.dir/KInstruction.cpp.i"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/strahinja/repo/klee/lib/Module/KInstruction.cpp > CMakeFiles/kleeModule.dir/KInstruction.cpp.i

lib/Module/CMakeFiles/kleeModule.dir/KInstruction.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kleeModule.dir/KInstruction.cpp.s"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/strahinja/repo/klee/lib/Module/KInstruction.cpp -o CMakeFiles/kleeModule.dir/KInstruction.cpp.s

lib/Module/CMakeFiles/kleeModule.dir/KModule.cpp.o: lib/Module/CMakeFiles/kleeModule.dir/flags.make
lib/Module/CMakeFiles/kleeModule.dir/KModule.cpp.o: ../lib/Module/KModule.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/strahinja/repo/klee/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object lib/Module/CMakeFiles/kleeModule.dir/KModule.cpp.o"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/kleeModule.dir/KModule.cpp.o -c /home/strahinja/repo/klee/lib/Module/KModule.cpp

lib/Module/CMakeFiles/kleeModule.dir/KModule.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kleeModule.dir/KModule.cpp.i"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/strahinja/repo/klee/lib/Module/KModule.cpp > CMakeFiles/kleeModule.dir/KModule.cpp.i

lib/Module/CMakeFiles/kleeModule.dir/KModule.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kleeModule.dir/KModule.cpp.s"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/strahinja/repo/klee/lib/Module/KModule.cpp -o CMakeFiles/kleeModule.dir/KModule.cpp.s

lib/Module/CMakeFiles/kleeModule.dir/LowerSwitch.cpp.o: lib/Module/CMakeFiles/kleeModule.dir/flags.make
lib/Module/CMakeFiles/kleeModule.dir/LowerSwitch.cpp.o: ../lib/Module/LowerSwitch.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/strahinja/repo/klee/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object lib/Module/CMakeFiles/kleeModule.dir/LowerSwitch.cpp.o"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/kleeModule.dir/LowerSwitch.cpp.o -c /home/strahinja/repo/klee/lib/Module/LowerSwitch.cpp

lib/Module/CMakeFiles/kleeModule.dir/LowerSwitch.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kleeModule.dir/LowerSwitch.cpp.i"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/strahinja/repo/klee/lib/Module/LowerSwitch.cpp > CMakeFiles/kleeModule.dir/LowerSwitch.cpp.i

lib/Module/CMakeFiles/kleeModule.dir/LowerSwitch.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kleeModule.dir/LowerSwitch.cpp.s"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/strahinja/repo/klee/lib/Module/LowerSwitch.cpp -o CMakeFiles/kleeModule.dir/LowerSwitch.cpp.s

lib/Module/CMakeFiles/kleeModule.dir/ModuleUtil.cpp.o: lib/Module/CMakeFiles/kleeModule.dir/flags.make
lib/Module/CMakeFiles/kleeModule.dir/ModuleUtil.cpp.o: ../lib/Module/ModuleUtil.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/strahinja/repo/klee/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object lib/Module/CMakeFiles/kleeModule.dir/ModuleUtil.cpp.o"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/kleeModule.dir/ModuleUtil.cpp.o -c /home/strahinja/repo/klee/lib/Module/ModuleUtil.cpp

lib/Module/CMakeFiles/kleeModule.dir/ModuleUtil.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kleeModule.dir/ModuleUtil.cpp.i"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/strahinja/repo/klee/lib/Module/ModuleUtil.cpp > CMakeFiles/kleeModule.dir/ModuleUtil.cpp.i

lib/Module/CMakeFiles/kleeModule.dir/ModuleUtil.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kleeModule.dir/ModuleUtil.cpp.s"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/strahinja/repo/klee/lib/Module/ModuleUtil.cpp -o CMakeFiles/kleeModule.dir/ModuleUtil.cpp.s

lib/Module/CMakeFiles/kleeModule.dir/Optimize.cpp.o: lib/Module/CMakeFiles/kleeModule.dir/flags.make
lib/Module/CMakeFiles/kleeModule.dir/Optimize.cpp.o: ../lib/Module/Optimize.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/strahinja/repo/klee/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object lib/Module/CMakeFiles/kleeModule.dir/Optimize.cpp.o"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/kleeModule.dir/Optimize.cpp.o -c /home/strahinja/repo/klee/lib/Module/Optimize.cpp

lib/Module/CMakeFiles/kleeModule.dir/Optimize.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kleeModule.dir/Optimize.cpp.i"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/strahinja/repo/klee/lib/Module/Optimize.cpp > CMakeFiles/kleeModule.dir/Optimize.cpp.i

lib/Module/CMakeFiles/kleeModule.dir/Optimize.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kleeModule.dir/Optimize.cpp.s"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/strahinja/repo/klee/lib/Module/Optimize.cpp -o CMakeFiles/kleeModule.dir/Optimize.cpp.s

lib/Module/CMakeFiles/kleeModule.dir/OptNone.cpp.o: lib/Module/CMakeFiles/kleeModule.dir/flags.make
lib/Module/CMakeFiles/kleeModule.dir/OptNone.cpp.o: ../lib/Module/OptNone.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/strahinja/repo/klee/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object lib/Module/CMakeFiles/kleeModule.dir/OptNone.cpp.o"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/kleeModule.dir/OptNone.cpp.o -c /home/strahinja/repo/klee/lib/Module/OptNone.cpp

lib/Module/CMakeFiles/kleeModule.dir/OptNone.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kleeModule.dir/OptNone.cpp.i"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/strahinja/repo/klee/lib/Module/OptNone.cpp > CMakeFiles/kleeModule.dir/OptNone.cpp.i

lib/Module/CMakeFiles/kleeModule.dir/OptNone.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kleeModule.dir/OptNone.cpp.s"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/strahinja/repo/klee/lib/Module/OptNone.cpp -o CMakeFiles/kleeModule.dir/OptNone.cpp.s

lib/Module/CMakeFiles/kleeModule.dir/PhiCleaner.cpp.o: lib/Module/CMakeFiles/kleeModule.dir/flags.make
lib/Module/CMakeFiles/kleeModule.dir/PhiCleaner.cpp.o: ../lib/Module/PhiCleaner.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/strahinja/repo/klee/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object lib/Module/CMakeFiles/kleeModule.dir/PhiCleaner.cpp.o"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/kleeModule.dir/PhiCleaner.cpp.o -c /home/strahinja/repo/klee/lib/Module/PhiCleaner.cpp

lib/Module/CMakeFiles/kleeModule.dir/PhiCleaner.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kleeModule.dir/PhiCleaner.cpp.i"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/strahinja/repo/klee/lib/Module/PhiCleaner.cpp > CMakeFiles/kleeModule.dir/PhiCleaner.cpp.i

lib/Module/CMakeFiles/kleeModule.dir/PhiCleaner.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kleeModule.dir/PhiCleaner.cpp.s"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/strahinja/repo/klee/lib/Module/PhiCleaner.cpp -o CMakeFiles/kleeModule.dir/PhiCleaner.cpp.s

lib/Module/CMakeFiles/kleeModule.dir/RaiseAsm.cpp.o: lib/Module/CMakeFiles/kleeModule.dir/flags.make
lib/Module/CMakeFiles/kleeModule.dir/RaiseAsm.cpp.o: ../lib/Module/RaiseAsm.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/strahinja/repo/klee/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building CXX object lib/Module/CMakeFiles/kleeModule.dir/RaiseAsm.cpp.o"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/kleeModule.dir/RaiseAsm.cpp.o -c /home/strahinja/repo/klee/lib/Module/RaiseAsm.cpp

lib/Module/CMakeFiles/kleeModule.dir/RaiseAsm.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kleeModule.dir/RaiseAsm.cpp.i"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/strahinja/repo/klee/lib/Module/RaiseAsm.cpp > CMakeFiles/kleeModule.dir/RaiseAsm.cpp.i

lib/Module/CMakeFiles/kleeModule.dir/RaiseAsm.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kleeModule.dir/RaiseAsm.cpp.s"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/strahinja/repo/klee/lib/Module/RaiseAsm.cpp -o CMakeFiles/kleeModule.dir/RaiseAsm.cpp.s

lib/Module/CMakeFiles/kleeModule.dir/WorkaroundLLVMPR39177.cpp.o: lib/Module/CMakeFiles/kleeModule.dir/flags.make
lib/Module/CMakeFiles/kleeModule.dir/WorkaroundLLVMPR39177.cpp.o: ../lib/Module/WorkaroundLLVMPR39177.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/strahinja/repo/klee/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building CXX object lib/Module/CMakeFiles/kleeModule.dir/WorkaroundLLVMPR39177.cpp.o"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/kleeModule.dir/WorkaroundLLVMPR39177.cpp.o -c /home/strahinja/repo/klee/lib/Module/WorkaroundLLVMPR39177.cpp

lib/Module/CMakeFiles/kleeModule.dir/WorkaroundLLVMPR39177.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kleeModule.dir/WorkaroundLLVMPR39177.cpp.i"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/strahinja/repo/klee/lib/Module/WorkaroundLLVMPR39177.cpp > CMakeFiles/kleeModule.dir/WorkaroundLLVMPR39177.cpp.i

lib/Module/CMakeFiles/kleeModule.dir/WorkaroundLLVMPR39177.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kleeModule.dir/WorkaroundLLVMPR39177.cpp.s"
	cd /home/strahinja/repo/klee/build/lib/Module && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/strahinja/repo/klee/lib/Module/WorkaroundLLVMPR39177.cpp -o CMakeFiles/kleeModule.dir/WorkaroundLLVMPR39177.cpp.s

# Object files for target kleeModule
kleeModule_OBJECTS = \
"CMakeFiles/kleeModule.dir/Checks.cpp.o" \
"CMakeFiles/kleeModule.dir/FunctionAlias.cpp.o" \
"CMakeFiles/kleeModule.dir/InstructionInfoTable.cpp.o" \
"CMakeFiles/kleeModule.dir/InstructionOperandTypeCheckPass.cpp.o" \
"CMakeFiles/kleeModule.dir/IntrinsicCleaner.cpp.o" \
"CMakeFiles/kleeModule.dir/KInstruction.cpp.o" \
"CMakeFiles/kleeModule.dir/KModule.cpp.o" \
"CMakeFiles/kleeModule.dir/LowerSwitch.cpp.o" \
"CMakeFiles/kleeModule.dir/ModuleUtil.cpp.o" \
"CMakeFiles/kleeModule.dir/Optimize.cpp.o" \
"CMakeFiles/kleeModule.dir/OptNone.cpp.o" \
"CMakeFiles/kleeModule.dir/PhiCleaner.cpp.o" \
"CMakeFiles/kleeModule.dir/RaiseAsm.cpp.o" \
"CMakeFiles/kleeModule.dir/WorkaroundLLVMPR39177.cpp.o"

# External object files for target kleeModule
kleeModule_EXTERNAL_OBJECTS =

lib/libkleeModule.a: lib/Module/CMakeFiles/kleeModule.dir/Checks.cpp.o
lib/libkleeModule.a: lib/Module/CMakeFiles/kleeModule.dir/FunctionAlias.cpp.o
lib/libkleeModule.a: lib/Module/CMakeFiles/kleeModule.dir/InstructionInfoTable.cpp.o
lib/libkleeModule.a: lib/Module/CMakeFiles/kleeModule.dir/InstructionOperandTypeCheckPass.cpp.o
lib/libkleeModule.a: lib/Module/CMakeFiles/kleeModule.dir/IntrinsicCleaner.cpp.o
lib/libkleeModule.a: lib/Module/CMakeFiles/kleeModule.dir/KInstruction.cpp.o
lib/libkleeModule.a: lib/Module/CMakeFiles/kleeModule.dir/KModule.cpp.o
lib/libkleeModule.a: lib/Module/CMakeFiles/kleeModule.dir/LowerSwitch.cpp.o
lib/libkleeModule.a: lib/Module/CMakeFiles/kleeModule.dir/ModuleUtil.cpp.o
lib/libkleeModule.a: lib/Module/CMakeFiles/kleeModule.dir/Optimize.cpp.o
lib/libkleeModule.a: lib/Module/CMakeFiles/kleeModule.dir/OptNone.cpp.o
lib/libkleeModule.a: lib/Module/CMakeFiles/kleeModule.dir/PhiCleaner.cpp.o
lib/libkleeModule.a: lib/Module/CMakeFiles/kleeModule.dir/RaiseAsm.cpp.o
lib/libkleeModule.a: lib/Module/CMakeFiles/kleeModule.dir/WorkaroundLLVMPR39177.cpp.o
lib/libkleeModule.a: lib/Module/CMakeFiles/kleeModule.dir/build.make
lib/libkleeModule.a: lib/Module/CMakeFiles/kleeModule.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/strahinja/repo/klee/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Linking CXX static library ../libkleeModule.a"
	cd /home/strahinja/repo/klee/build/lib/Module && $(CMAKE_COMMAND) -P CMakeFiles/kleeModule.dir/cmake_clean_target.cmake
	cd /home/strahinja/repo/klee/build/lib/Module && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/kleeModule.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lib/Module/CMakeFiles/kleeModule.dir/build: lib/libkleeModule.a

.PHONY : lib/Module/CMakeFiles/kleeModule.dir/build

lib/Module/CMakeFiles/kleeModule.dir/clean:
	cd /home/strahinja/repo/klee/build/lib/Module && $(CMAKE_COMMAND) -P CMakeFiles/kleeModule.dir/cmake_clean.cmake
.PHONY : lib/Module/CMakeFiles/kleeModule.dir/clean

lib/Module/CMakeFiles/kleeModule.dir/depend:
	cd /home/strahinja/repo/klee/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/strahinja/repo/klee /home/strahinja/repo/klee/lib/Module /home/strahinja/repo/klee/build /home/strahinja/repo/klee/build/lib/Module /home/strahinja/repo/klee/build/lib/Module/CMakeFiles/kleeModule.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/Module/CMakeFiles/kleeModule.dir/depend

