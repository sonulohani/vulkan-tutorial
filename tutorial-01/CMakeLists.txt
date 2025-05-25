cmake_minimum_required(VERSION 3.10)
project(VulkanRotatingTriangle)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find required packages
find_package(PkgConfig REQUIRED)
find_package(glfw3 REQUIRED)

# Find Vulkan
find_package(Vulkan REQUIRED)

# Find GLM
find_package(glm REQUIRED)

# Add executable
add_executable(${PROJECT_NAME} 
    src/main.cpp
    src/VulkanApp.cpp
    src/VulkanApp.h
)

# Link libraries
target_link_libraries(${PROJECT_NAME} 
    ${Vulkan_LIBRARIES}
    glfw
    ${CMAKE_DL_LIBS}
)

# Include directories
target_include_directories(${PROJECT_NAME} PRIVATE 
    ${Vulkan_INCLUDE_DIRS}
    src/
)

# Compile definitions
target_compile_definitions(${PROJECT_NAME} PRIVATE 
    VK_USE_PLATFORM_XLIB_KHR
)

# Shader compilation
find_program(GLSLC glslc)

function(add_shader TARGET SHADER)
    find_program(GLSLC glslc)
    set(current-shader-path ${CMAKE_CURRENT_SOURCE_DIR}/shaders/${SHADER})
    set(current-output-path ${CMAKE_CURRENT_BINARY_DIR}/shaders/${SHADER}.spv)

    get_filename_component(current-output-dir ${current-output-path} DIRECTORY)
    file(MAKE_DIRECTORY ${current-output-dir})

    add_custom_command(
        OUTPUT ${current-output-path}
        COMMAND ${GLSLC} -o ${current-output-path} ${current-shader-path}
        DEPENDS ${current-shader-path}
        IMPLICIT_DEPENDS CXX ${current-shader-path}
        VERBATIM)

    set_source_files_properties(${current-output-path} PROPERTIES GENERATED TRUE)
    target_sources(${TARGET} PRIVATE ${current-output-path})
endfunction(add_shader)

add_shader(${PROJECT_NAME} triangle.vert)
add_shader(${PROJECT_NAME} triangle.frag) 