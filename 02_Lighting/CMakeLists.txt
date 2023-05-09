add_executable( 02_Lighting
    ${STB_SOURCES}
    src/shader.hpp
    src/camera.hpp
    src/main.cpp
)

target_include_directories( 02_Lighting
PRIVATE
    ${LEARN_GL_ROOT_DIR}/third_party/glad/include/
    ${LEARN_GL_ROOT_DIR}/third_party/glfw/include/
    ${LEARN_GL_ROOT_DIR}/third_party/glm/
    ${LEARN_GL_ROOT_DIR}/third_party/stb_image/
)

target_link_libraries( 02_Lighting
PRIVATE
    OpenGL::GL
    glad::glad
    glfw
)

# ---- executable install ----
install(TARGETS 02_Lighting
    CONFIGURATIONS Release
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION bin
)

file(GLOB assets_02_Lighting assets/*)
install(FILES ${assets_02_Lighting}
    CONFIGURATIONS Release Debug
    DESTINATION assets/02_Lighting/
)