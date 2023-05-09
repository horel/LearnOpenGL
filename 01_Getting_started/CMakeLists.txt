add_executable( 01_Getting_started
    ${STB_SOURCES}
    src/shader.hpp
    src/camera.hpp
    src/main.cpp
)

target_include_directories( 01_Getting_started
PRIVATE
    ${LEARN_GL_ROOT_DIR}/third_party/glad/include/
    ${LEARN_GL_ROOT_DIR}/third_party/glfw/include/
    ${LEARN_GL_ROOT_DIR}/third_party/glm/
    ${LEARN_GL_ROOT_DIR}/third_party/stb_image/
)

target_link_libraries( 01_Getting_started
PRIVATE
    OpenGL::GL
    glad::glad
    glfw
)

# ---- executable install ----
install(TARGETS 01_Getting_started
    CONFIGURATIONS Release
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION bin
)

file(GLOB assets_01_Getting_started assets/*)
install(FILES ${assets_01_Getting_started}
    CONFIGURATIONS Release Debug
    DESTINATION assets/01_Getting_started/
)