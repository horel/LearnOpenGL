cmake_minimum_required(VERSION 3.19 FATAL_ERROR)

project(LearnOpenGL VERSION 0.0.1 LANGUAGES C CXX)

# ---- Include guards ----
if(PROJECT_SOURCE_DIR STREQUAL PROJECT_BINARY_DIR)
    message(FATAL_ERROR "[__ERROR__] In-source builds not allowed. Please make a new directory (called a build directory) and run CMake from there.")
endif()

# ---- info ----
message(STATUS "[__INFO__] CMAKE VERSION: ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}.${CMAKE_PATCH_VERSION}")
message(STATUS "[__INFO__] Current Platform is: ${CMAKE_SYSTEM}")


# ---- env setting ----
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
# Output compile_commands.json for clangd
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
if(MSVC)
    set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
    # set(BUILD_SHARED_LIBS OFF) # cmake default is off 
endif(MSVC)


# ---- Set a default build type if none was specified ----
if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
    message(STATUS "[__INFO__] Setting build type to '${CMAKE_BUILD_TYPE}' as none was specified.")
    set(CMAKE_BUILD_TYPE Release CACHE STRING "Choose the type of build." FORCE)
endif()
message(STATUS "[__INFO__] Build type : '${CMAKE_BUILD_TYPE}'")


# ---- install dir setting ----
set(LEARN_GL_ROOT_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
set(CMAKE_INSTALL_PREFIX "${LEARN_GL_ROOT_DIR}/_install")
set(BINARY_ROOT_DIR "${CMAKE_INSTALL_PREFIX}/")
# ---- output dir setting ----
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${BINARY_ROOT_DIR}/build-int)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${BINARY_ROOT_DIR}/build-int)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${BINARY_ROOT_DIR}/build-int)
foreach(OUTPUTCONFIG ${CMAKE_CONFIGURATION_TYPES})
    string(TOUPPER ${OUTPUTCONFIG} OUTPUTCONFIG)
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_${OUTPUTCONFIG} ${BINARY_ROOT_DIR}/build-int)
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_${OUTPUTCONFIG} ${BINARY_ROOT_DIR}/build-int)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_${OUTPUTCONFIG} ${BINARY_ROOT_DIR}/build-int)
endforeach(OUTPUTCONFIG CMAKE_CONFIGURATION_TYPES)


# ---- find package ----
find_package(OpenGL REQUIRED)
if(OpenGL_FOUND)
    message (STATUS "[__FIND__] OpenGL found")
else()
    message (FATAL_ERROR "[__FIND__] Cannot find OpenGL")
endif()
# find_package(fmt CONFIG REQUIRED)


# ---- Add subdir ----
# for third_party
add_subdirectory(third_party/glad)
add_subdirectory(third_party/stb_image)
# glfw3 library
# see https://www.glfw.org/docs/latest/build_guide.html#build_link_cmake_source
set(GLFW_BUILD_DOCS OFF CACHE BOOL "GLFW lib only" FORCE)
set(GLFW_BUILD_TESTS OFF CACHE BOOL "GLFW lib only" FORCE)
set(GLFW_BUILD_EXAMPLES OFF CACHE BOOL "GLFW lib only" FORCE)
set(GLFW_INSTALL OFF CACHE BOOL "GLFW lib only" FORCE)
add_subdirectory(third_party/glfw) # only glfw3.lib
# assimp library
set(ASSIMP_BUILD_ASSIMP_TOOLS OFF CACHE BOOL "NO TOOLS" FORCE)
set(ASSIMP_BUILD_SAMPLES OFF CACHE BOOL "NO SAMPLES" FORCE)
set(ASSIMP_BUILD_TESTS OFF CACHE BOOL "Assimp build tests" FORCE)
set(ASSIMP_NO_EXPORT ON CACHE BOOL "NO EXPORT" FORCE)
set(ASSIMP_BUILD_ALL_IMPORTERS_BY_DEFAULT OFF CACHE BOOL "NO IMPORTERS" FORCE)
set(ASSIMP_BUILD_OBJ_IMPORTER ON CACHE BOOL "IMPORT OBJ" FORCE)
set(ASSIMP_BUILD_MMD_IMPORTER ON CACHE BOOL "IMPORT PMX" FORCE)
set(ASSIMP_INSTALL OFF CACHE BOOL "Assimp install" FORCE) # Not valid under windows
set(BUILD_SHARED_LIBS ON)
add_subdirectory(third_party/assimp)
set(BUILD_SHARED_LIBS OFF)
# for each chapter
add_subdirectory(01_Getting_started)
add_subdirectory(02_Lighting)
add_subdirectory(03_Model_Loading)
# for CTests
option(ENABLE_TESTS "Enable CTests" OFF)
if(ENABLE_TESTS)
    add_subdirectory(tests)
endif(ENABLE_TESTS)


# ---- library install ----
# RUNTIME : exe&dll(windows)
# ARCHIVE : lib
# LIBRARY : dll
install(TARGETS glad # only have glad.lib
    CONFIGURATIONS Release
    # LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib 
    # RUNTIME DESTINATION bin
)

install(TARGETS glfw # only have glfw3.lib
    CONFIGURATIONS Release
    # LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib 
    # RUNTIME DESTINATION bin
)

install(TARGETS assimp # only have assimp.so
    CONFIGURATIONS Release
    LIBRARY DESTINATION bin
    # ARCHIVE DESTINATION lib 
    # RUNTIME DESTINATION bin
)