# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/neg/Documents/dev/lp/euler/drifting_sets/validator/lemon-1.3.1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/neg/Documents/dev/lp/euler/drifting_sets/validator/lemon-1.3.1/build

# Include any dependencies generated for this target.
include test/CMakeFiles/dim_test.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include test/CMakeFiles/dim_test.dir/compiler_depend.make

# Include the progress variables for this target.
include test/CMakeFiles/dim_test.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/dim_test.dir/flags.make

test/CMakeFiles/dim_test.dir/dim_test.cc.o: test/CMakeFiles/dim_test.dir/flags.make
test/CMakeFiles/dim_test.dir/dim_test.cc.o: /home/neg/Documents/dev/lp/euler/drifting_sets/validator/lemon-1.3.1/test/dim_test.cc
test/CMakeFiles/dim_test.dir/dim_test.cc.o: test/CMakeFiles/dim_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/neg/Documents/dev/lp/euler/drifting_sets/validator/lemon-1.3.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/dim_test.dir/dim_test.cc.o"
	cd /home/neg/Documents/dev/lp/euler/drifting_sets/validator/lemon-1.3.1/build/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT test/CMakeFiles/dim_test.dir/dim_test.cc.o -MF CMakeFiles/dim_test.dir/dim_test.cc.o.d -o CMakeFiles/dim_test.dir/dim_test.cc.o -c /home/neg/Documents/dev/lp/euler/drifting_sets/validator/lemon-1.3.1/test/dim_test.cc

test/CMakeFiles/dim_test.dir/dim_test.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/dim_test.dir/dim_test.cc.i"
	cd /home/neg/Documents/dev/lp/euler/drifting_sets/validator/lemon-1.3.1/build/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/neg/Documents/dev/lp/euler/drifting_sets/validator/lemon-1.3.1/test/dim_test.cc > CMakeFiles/dim_test.dir/dim_test.cc.i

test/CMakeFiles/dim_test.dir/dim_test.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/dim_test.dir/dim_test.cc.s"
	cd /home/neg/Documents/dev/lp/euler/drifting_sets/validator/lemon-1.3.1/build/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/neg/Documents/dev/lp/euler/drifting_sets/validator/lemon-1.3.1/test/dim_test.cc -o CMakeFiles/dim_test.dir/dim_test.cc.s

# Object files for target dim_test
dim_test_OBJECTS = \
"CMakeFiles/dim_test.dir/dim_test.cc.o"

# External object files for target dim_test
dim_test_EXTERNAL_OBJECTS =

test/dim_test: test/CMakeFiles/dim_test.dir/dim_test.cc.o
test/dim_test: test/CMakeFiles/dim_test.dir/build.make
test/dim_test: lemon/libemon.a
test/dim_test: test/CMakeFiles/dim_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/neg/Documents/dev/lp/euler/drifting_sets/validator/lemon-1.3.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable dim_test"
	cd /home/neg/Documents/dev/lp/euler/drifting_sets/validator/lemon-1.3.1/build/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/dim_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/dim_test.dir/build: test/dim_test
.PHONY : test/CMakeFiles/dim_test.dir/build

test/CMakeFiles/dim_test.dir/clean:
	cd /home/neg/Documents/dev/lp/euler/drifting_sets/validator/lemon-1.3.1/build/test && $(CMAKE_COMMAND) -P CMakeFiles/dim_test.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/dim_test.dir/clean

test/CMakeFiles/dim_test.dir/depend:
	cd /home/neg/Documents/dev/lp/euler/drifting_sets/validator/lemon-1.3.1/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/neg/Documents/dev/lp/euler/drifting_sets/validator/lemon-1.3.1 /home/neg/Documents/dev/lp/euler/drifting_sets/validator/lemon-1.3.1/test /home/neg/Documents/dev/lp/euler/drifting_sets/validator/lemon-1.3.1/build /home/neg/Documents/dev/lp/euler/drifting_sets/validator/lemon-1.3.1/build/test /home/neg/Documents/dev/lp/euler/drifting_sets/validator/lemon-1.3.1/build/test/CMakeFiles/dim_test.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : test/CMakeFiles/dim_test.dir/depend

