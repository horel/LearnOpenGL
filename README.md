# LearnOpenGL
The code repository I used to learn OpenGL.

## Continuous build status

|    Build Type     |                                                                                      Status                                                                                      |
| :---------------: | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| **Build Windows** | [![Build Windows](https://github.com/horel/LearnOpenGL/actions/workflows/build_windows.yml/badge.svg)](https://github.com/horel/LearnOpenGL/actions/workflows/build_windows.yml) |
|  **Build Linux**  |    [![Build Linux](https://github.com/horel/LearnOpenGL/actions/workflows/build_linux.yml/badge.svg)](https://github.com/horel/LearnOpenGL/actions/workflows/build_linux.yml)    |
|  **Build macOS**  |    [![Build macOS](https://github.com/horel/LearnOpenGL/actions/workflows/build_macos.yml/badge.svg)](https://github.com/horel/LearnOpenGL/actions/workflows/build_macos.yml)    |

## Reference
- [Learn OpenGL](https://learnopengl.com/) : Great OpenGL tutorials.
- [Learn OpenGL CN](https://learnopengl-cn.github.io/) : Corresponding Chinese translation.

## Third Party Libraries
- [GLFW](https://www.glfw.org) : Handling windows and mouse and keyboard events.
- [glad](https://glad.dav1d.de) : OpenGL functions loader.
- [GLM](https://github.com/g-truc/glm) : OpenGL Mathematics (GLM).
- [stb](https://github.com/nothings/stb.git) : stb single-file public domain libraries for C/C++.
- [Assimp](https://github.com/assimp/assimp.git) : The official Open-Asset-Importer-Library Repository.

## Prerequisites
To build project, you must first install the following tools.
- GCC / Clang / MSVC (Support C++ 17 Standard)
- Git
- CMake

## Build
### Clone Repo
```cpp
git clone --recursive https://github.com/horel/LearnOpenGL.git

cd LearnOpenGL
```
### Build Project
```cpp
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release

cmake --build build --config Release --target "install"
```

##  Note

__The project will be built in the ```<LearnOpenGL repo>/_install``` directory.__
