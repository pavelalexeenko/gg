cmake_minimum_required(VERSION 3.8 FATAL_ERROR)

set(NAME Framework)
project(${NAME})

# cmake
include(cmake/functions.cmake)

# external libs
include_directories(external)

add_subdirectory(Framework)

