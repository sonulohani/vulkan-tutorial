# Tutorial 02 - Vulkan Core Concepts

This tutorial demonstrates the essential core concepts of the Vulkan API:

## 1. Vulkan Architecture and Instance Creation

- Setting up a Vulkan instance
- Enumerating and selecting a physical device (GPU)
- Creating a logical device to interface with the hardware

## 2. Physical and Logical Devices

- Enumerating available physical devices
- Querying device properties and capabilities
- Creating a logical device with required features
- Setting up queue families for different operations

## 3. Command Buffers and Queues

- Creating command pools for memory management
- Allocating command buffers
- Recording commands (demonstrated with empty command buffers)
- Submitting command buffers to device queues

## 4. Synchronization Primitives

- Creating and using semaphores for GPU-GPU synchronization
- Creating and using fences for CPU-GPU synchronization
- Demonstrating the synchronization flow in a multi-frame setup

## Building and Running

```bash
cd tutorial-02
mkdir build
cd build
cmake ..
make
./vulkan_tutorial_02
```

## Code Structure

The application demonstrates a complete Vulkan setup with proper resource initialization and cleanup:

1. GLFW window creation and integration with Vulkan
2. Vulkan instance initialization with validation layers
3. Device selection and logical device creation
4. Command buffer allocation and recording
5. Synchronization object creation
6. Command submission demo in the main loop
7. Proper cleanup of all resources

This tutorial doesn't implement any actual rendering but focuses on setting up the core Vulkan infrastructure necessary for any Vulkan application. 