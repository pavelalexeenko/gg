cmake_minimum_required(VERSION 3.15 FATAL_ERROR)
project(Framework)

message(STATUS "----- Build Config ----")
message(STATUS "Compiler = ${CMAKE_CXX_COMPILER_ID} ${CMAKE_CXX_COMPILER_VERSION}")

set(CMAKE_INCLUDE_CURRENT_DIR ON)

# C++17 standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Take care of warnings about strcpy
if (MSVC)
    add_definitions(-D_CRT_SECURE_NO_WARNINGS)
	if (NOT DEFINED NOMINMAX)
		add_definitions(-DNOMINMAX)	# Entt warning, see https://github.com/skypjack/entt/wiki/Frequently-Asked-Questions#warning-C4003-the-min-the-max-and-the-macro
	endif()
endif()

# set(CMAKE_CXX_FLAGS "-Wall -Wno-reorder -Wno-unknown-pragmas -Wno-multichar -Wno-missing-braces" )

message(STATUS "CMAKE_CXX_FLAGS = ${CMAKE_CXX_FLAGS}")

add_subdirectory(engine)
add_subdirectory(editor)