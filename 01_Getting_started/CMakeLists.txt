add_executable( 01_Getting_started
    src/main.cpp
)

target_include_directories( 01_Getting_started
PRIVATE
    ${LEARN_GL_ROOT_DIR}/third_party/glad/include/
    ${LEARN_GL_ROOT_DIR}/third_party/glfw/include/
)

target_link_libraries( 01_Getting_started
PRIVATE
    OpenGL::GL
    glad::glad
    glfw
)

# ---- executable install ----
install(TARGETS 01_Getting_started
    CONFIGURATIONS Release Debug
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        RUNTIME DESTINATION bin
)