project(Engine)


if(MSVC)
    set(MY_COMPILER_FLAGS "/W3" )
else()
    set(MY_COMPILER_FLAGS "-Wall -Wno-reorder -Wno-unknown-pragmas -Wno-multichar -Wno-missing-braces")
endif()

set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${MY_COMPILER_FLAGS}")

find_package(Vulkan REQUIRED FATAL_ERROR)

add_subdirectory(external/entt)

include_directories(external/entt/src)

file(GLOB sources
    src/*.h
    src/*.cpp
)

add_library(${PROJECT_NAME} ${sources})

target_compile_definitions(${PROJECT_NAME} PRIVATE VK_USE_PLATFORM_WIN32_KHR)

target_link_libraries(${PROJECT_NAME} LINK_PUBLIC Vulkan::Vulkan)
target_link_libraries(${PROJECT_NAME} LINK_PUBLIC entt)

