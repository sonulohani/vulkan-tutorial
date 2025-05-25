cmake_minimum_required(VERSION 3.16)
project(vulkan_tutorial_02 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Vulkan REQUIRED)
find_package(glfw3 REQUIRED)
find_package(glm REQUIRED)

add_executable(vulkan_tutorial_02 main.cpp)

target_include_directories(vulkan_tutorial_02 PRIVATE ${Vulkan_INCLUDE_DIRS})
target_link_libraries(vulkan_tutorial_02 PRIVATE Vulkan::Vulkan glfw) 