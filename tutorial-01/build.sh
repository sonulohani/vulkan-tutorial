#!/bin/bash

# Vulkan Rotating Triangle Build Script

echo "Building Vulkan Rotating Triangle..."

# Create build directory
mkdir -p build

# Compile shaders
echo "Compiling shaders..."
glslc shaders/triangle.vert -o shaders/triangle.vert.spv
glslc shaders/triangle.frag -o shaders/triangle.frag.spv

# Try CMake first
echo "Attempting CMake build..."
cd build
if cmake .. && make; then
    echo "CMake build successful!"
    echo "Run ./VulkanRotatingTriangle to start the application"
    exit 0
fi

# Fallback to manual compilation
echo "CMake failed, trying manual compilation..."
cd ..

# Find Vulkan SDK path
VULKAN_SDK_PATH=""
if [ -d "$HOME/.local/vulkan_sdk" ]; then
    VULKAN_SDK_PATH=$(find $HOME/.local/vulkan_sdk -name "include" -type d | head -1 | sed 's|/include||')
elif [ -d "/usr/include/vulkan" ]; then
    VULKAN_SDK_PATH="/usr"
fi

if [ -z "$VULKAN_SDK_PATH" ]; then
    echo "Error: Could not find Vulkan SDK. Please install the Vulkan SDK."
    exit 1
fi

echo "Using Vulkan SDK at: $VULKAN_SDK_PATH"

# Manual compilation
g++ -std=c++17 \
    -I/usr/include \
    -I$VULKAN_SDK_PATH/include \
    -Isrc/ \
    src/main.cpp src/VulkanApp.cpp \
    -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi \
    -o VulkanRotatingTriangle

if [ $? -eq 0 ]; then
    echo "Manual compilation successful!"
    echo "Run ./VulkanRotatingTriangle to start the application"
else
    echo "Compilation failed. Please check that all dependencies are installed:"
    echo "- Vulkan SDK"
    echo "- GLFW3 development libraries"
    echo "- GLM development libraries"
    echo "- GCC/G++ compiler"
    exit 1
fi 