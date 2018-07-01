cmake_minimum_required(VERSION 2.6.0)

project(hello C)

set(CMAKE_C_COMPILER /usr/bin/gcc)

#for generate the compile_commands.json to enable the YCM completion
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)



add_executable(test test.c)
