#!/bin/bash

# Set up Vulkan SDK environment
export VULKAN_SDK_PATH="$HOME/.local/vulkan_sdk/1.4.313.0/x86_64"
export VK_LAYER_PATH="$VULKAN_SDK_PATH/share/vulkan/explicit_layer.d"
export LD_LIBRARY_PATH="$VULKAN_SDK_PATH/lib:$LD_LIBRARY_PATH"

echo "=== Vulkan Tutorial 02 Runner ==="
echo "Vulkan SDK: $VULKAN_SDK_PATH"
echo "VK_LAYER_PATH: $VK_LAYER_PATH"
echo "=================================="

# Build if executable doesn't exist
if [ ! -f "./vulkan_tutorial_02" ]; then
    echo "Building tutorial..."
    make
fi

# Run the tutorial
echo "Running tutorial..."
./vulkan_tutorial_02 