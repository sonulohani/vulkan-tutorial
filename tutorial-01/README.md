# Vulkan Rotating Triangle

A simple Vulkan application that renders a rotating triangle with vertex colors. This project demonstrates the basics of Vulkan graphics programming including:

- Vulkan instance and device creation
- Swap chain management
- Graphics pipeline setup
- Vertex buffers and uniform buffers
- Shader compilation and loading
- Real-time rendering with rotation animation

## Features

- **Rotating Triangle**: A colorful triangle that rotates continuously around the Z-axis
- **Vertex Colors**: Each vertex has a different color (red, green, blue) that interpolates across the triangle
- **Modern Vulkan**: Uses Vulkan API for low-level graphics programming
- **Cross-platform**: Works on Linux with X11

## Prerequisites

Before building this project, make sure you have the following installed:

- **CMake** (version 3.10 or higher)
- **Vulkan SDK**: Download from [LunarG](https://vulkan.lunarg.com/)
- **GLFW3**: For window management
- **GLM**: For mathematics (vectors, matrices)
- **glslc**: Shader compiler (comes with Vulkan SDK)

### Ubuntu/Debian Installation

```bash
# Install development tools
sudo apt update
sudo apt install cmake build-essential

# Install Vulkan SDK
wget -qO - https://packages.lunarg.com/lunarg-signing-key-pub.asc | sudo apt-key add -
sudo wget -qO /etc/apt/sources.list.d/lunarg-vulkan-jammy.list https://packages.lunarg.com/vulkan/lunarg-vulkan-jammy.list
sudo apt update
sudo apt install vulkan-sdk

# Install GLFW and GLM
sudo apt install libglfw3-dev libglm-dev

# Verify installation
vulkaninfo
```

## Building

### Option 1: Using the Build Script (Recommended)

The easiest way to build the project is using the provided build script:

```bash
./build.sh
```

This script will:
1. Compile the shaders to SPIR-V bytecode
2. Try to build using CMake
3. Fall back to manual compilation if CMake fails

### Option 2: Manual CMake Build

1. Create a build directory and compile:

```bash
mkdir build
cd build
cmake ..
make
```

### Option 3: Manual Compilation

If CMake doesn't work, you can compile manually:

```bash
# Compile shaders
glslc shaders/triangle.vert -o shaders/triangle.vert.spv
glslc shaders/triangle.frag -o shaders/triangle.frag.spv

# Compile the application
g++ -std=c++17 -I/usr/include -I$VULKAN_SDK/include -Isrc/ \
    src/main.cpp src/VulkanApp.cpp \
    -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi \
    -o VulkanRotatingTriangle
```

## Running

After successful compilation, run the executable:

```bash
./VulkanRotatingTriangle
```

You should see a window with a rotating triangle that has red, green, and blue vertices.

## Controls

- **ESC** or close window: Exit the application
- The triangle rotates automatically at 90 degrees per second

## Project Structure

```
.
├── CMakeLists.txt          # Build configuration
├── README.md              # This file
├── build.sh               # Build script (recommended)
├── src/
│   ├── main.cpp           # Application entry point
│   ├── VulkanApp.h        # Main application class header
│   └── VulkanApp.cpp      # Main application implementation
└── shaders/
    ├── triangle.vert      # Vertex shader
    ├── triangle.frag      # Fragment shader
    ├── triangle.vert.spv  # Compiled vertex shader (generated)
    └── triangle.frag.spv  # Compiled fragment shader (generated)
```

## Technical Details

- **Graphics API**: Vulkan 1.0
- **Window System**: GLFW3
- **Mathematics**: GLM
- **Shading Language**: GLSL 4.50
- **Rendering**: Forward rendering with uniform buffer objects for transformation matrices

The application creates a simple graphics pipeline that:
1. Loads vertex data (positions and colors) into a vertex buffer
2. Uses uniform buffers to pass transformation matrices to shaders
3. Applies model, view, and projection transformations
4. Renders the triangle with smooth color interpolation
5. Updates the rotation every frame for animation

## Troubleshooting

### Vulkan Validation Layers
If you encounter validation layer errors, make sure the Vulkan SDK is properly installed and the validation layers are available.

### Shader Compilation
If shaders fail to compile, ensure `glslc` is in your PATH and the shader files are present in the `shaders/` directory.

### Graphics Drivers
Make sure you have up-to-date graphics drivers that support Vulkan. You can check Vulkan support with:
```bash
vulkaninfo
```

### Build Issues
If you encounter build issues:
1. Try using the `build.sh` script which handles common problems automatically
2. Ensure all dependencies are properly installed
3. Check that your compiler supports C++17
4. Verify that the Vulkan SDK is properly installed and in your PATH 