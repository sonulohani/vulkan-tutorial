cmake_minimum_required(VERSION 3.16)
project(vulkan_tutorials LANGUAGES CXX)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Add the tutorials
add_subdirectory(tutorial-02)

# Add other tutorials as they are created
# add_subdirectory(tutorial-03)
# ...

# Print status message
message(STATUS "Configured Vulkan Tutorials project") 