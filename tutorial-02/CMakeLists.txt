cmake_minimum_required(VERSION 3.10)
project(VulkanTutorial02)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find required packages
find_package(PkgConfig REQUIRED)

# Set custom Vulkan SDK path
set(VULKAN_SDK_PATH "$ENV{HOME}/.local/vulkan_sdk/1.4.313.0/x86_64")
set(Vulkan_INCLUDE_DIRS "${VULKAN_SDK_PATH}/include")
set(Vulkan_LIBRARIES "${VULKAN_SDK_PATH}/lib/libvulkan.so")

# Verify Vulkan installation
if(NOT EXISTS "${Vulkan_INCLUDE_DIRS}/vulkan/vulkan.h")
    message(FATAL_ERROR "Vulkan headers not found at ${Vulkan_INCLUDE_DIRS}")
endif()
if(NOT EXISTS "${Vulkan_LIBRARIES}")
    message(FATAL_ERROR "Vulkan library not found at ${Vulkan_LIBRARIES}")
endif()

# Find GLFW
pkg_check_modules(GLFW3 REQUIRED glfw3)

# Add executable
add_executable(vulkan_tutorial_02 main.cpp)

# Link libraries
target_link_libraries(vulkan_tutorial_02 
    ${Vulkan_LIBRARIES}
    ${GLFW3_LIBRARIES}
)

# Include directories
target_include_directories(vulkan_tutorial_02 PRIVATE 
    ${Vulkan_INCLUDE_DIRS}
    ${GLFW3_INCLUDE_DIRS}
)

# Compiler definitions
target_compile_definitions(vulkan_tutorial_02 PRIVATE 
    ${GLFW3_CFLAGS_OTHER}
)

# Enable debug symbols and validation layers in debug mode
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    target_compile_definitions(vulkan_tutorial_02 PRIVATE DEBUG)
endif() 