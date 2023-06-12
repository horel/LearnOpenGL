add_executable( 04_02_Stencil_Testing
    ${STB_SOURCES}
    shader.hpp
    camera.hpp
    main.cpp
)

target_include_directories( 04_02_Stencil_Testing
PRIVATE
    ${LEARN_GL_ROOT_DIR}/third_party/glad/include/
    ${LEARN_GL_ROOT_DIR}/third_party/glfw/include/
    ${LEARN_GL_ROOT_DIR}/third_party/glm/
    ${LEARN_GL_ROOT_DIR}/third_party/stb_image/
)

target_link_libraries( 04_02_Stencil_Testing
PRIVATE
    OpenGL::GL
    glad::glad
    glfw
)

# ---- executable install ----
install(TARGETS 04_02_Stencil_Testing
    CONFIGURATIONS Release
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION bin
)