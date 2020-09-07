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
include tools/klee/CMakeFiles/klee.dir/depend.make

# Include the progress variables for this target.
include tools/klee/CMakeFiles/klee.dir/progress.make

# Include the compile flags for this target's objects.
include tools/klee/CMakeFiles/klee.dir/flags.make

tools/klee/CMakeFiles/klee.dir/main.cpp.o: tools/klee/CMakeFiles/klee.dir/flags.make
tools/klee/CMakeFiles/klee.dir/main.cpp.o: ../tools/klee/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/strahinja/repo/klee/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tools/klee/CMakeFiles/klee.dir/main.cpp.o"
	cd /home/strahinja/repo/klee/build/tools/klee && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/klee.dir/main.cpp.o -c /home/strahinja/repo/klee/tools/klee/main.cpp

tools/klee/CMakeFiles/klee.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/klee.dir/main.cpp.i"
	cd /home/strahinja/repo/klee/build/tools/klee && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/strahinja/repo/klee/tools/klee/main.cpp > CMakeFiles/klee.dir/main.cpp.i

tools/klee/CMakeFiles/klee.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/klee.dir/main.cpp.s"
	cd /home/strahinja/repo/klee/build/tools/klee && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/strahinja/repo/klee/tools/klee/main.cpp -o CMakeFiles/klee.dir/main.cpp.s

# Object files for target klee
klee_OBJECTS = \
"CMakeFiles/klee.dir/main.cpp.o"

# External object files for target klee
klee_EXTERNAL_OBJECTS =

bin/klee: tools/klee/CMakeFiles/klee.dir/main.cpp.o
bin/klee: tools/klee/CMakeFiles/klee.dir/build.make
bin/klee: lib/libkleeCore.a
bin/klee: /usr/lib/x86_64-linux-gnu/libsqlite3.so
bin/klee: lib/libkleeModule.a
bin/klee: lib/libkleaverSolver.a
bin/klee: lib/libkleeBasic.a
bin/klee: /usr/local/lib/libstp.so.2.3
bin/klee: /usr/local/lib/libminisat.so
bin/klee: lib/libkleaverExpr.a
bin/klee: lib/libkleeSupport.a
bin/klee: /usr/lib/x86_64-linux-gnu/libz.so
bin/klee: /usr/lib/x86_64-linux-gnu/libtcmalloc.so
bin/klee: /usr/lib/llvm-6.0/lib/libLLVM-6.0.so
bin/klee: tools/klee/CMakeFiles/klee.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/strahinja/repo/klee/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/klee"
	cd /home/strahinja/repo/klee/build/tools/klee && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/klee.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tools/klee/CMakeFiles/klee.dir/build: bin/klee

.PHONY : tools/klee/CMakeFiles/klee.dir/build

tools/klee/CMakeFiles/klee.dir/clean:
	cd /home/strahinja/repo/klee/build/tools/klee && $(CMAKE_COMMAND) -P CMakeFiles/klee.dir/cmake_clean.cmake
.PHONY : tools/klee/CMakeFiles/klee.dir/clean

tools/klee/CMakeFiles/klee.dir/depend:
	cd /home/strahinja/repo/klee/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/strahinja/repo/klee /home/strahinja/repo/klee/tools/klee /home/strahinja/repo/klee/build /home/strahinja/repo/klee/build/tools/klee /home/strahinja/repo/klee/build/tools/klee/CMakeFiles/klee.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tools/klee/CMakeFiles/klee.dir/depend

