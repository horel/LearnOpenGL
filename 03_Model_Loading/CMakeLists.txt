add_executable( 03_Model_Loading
    ${STB_SOURCES}
    src/shader.hpp
    src/camera.hpp
    src/mesh.hpp
    src/model.hpp
    src/main.cpp
)

target_include_directories( 03_Model_Loading
PRIVATE
    ${LEARN_GL_ROOT_DIR}/third_party/glad/include/
    ${LEARN_GL_ROOT_DIR}/third_party/glfw/include/
    ${LEARN_GL_ROOT_DIR}/third_party/glm/
    ${LEARN_GL_ROOT_DIR}/third_party/stb_image/
    ${LEARN_GL_ROOT_DIR}/third_party/assimp/include/
)

target_link_libraries( 03_Model_Loading
PRIVATE
    OpenGL::GL
    glad::glad
    glfw
    assimp
)

# $ORIGIN will be replaced as absolute path where shared lib is located
SET_TARGET_PROPERTIES(03_Model_Loading
    PROPERTIES INSTALL_RPATH "$ORIGIN;")
# ---- executable install ----
install(TARGETS 03_Model_Loading
    CONFIGURATIONS Release
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION bin
)

# ---- Assets install ----
install(DIRECTORY assets/picture assets/shader assets/Elysia
    CONFIGURATIONS Release Debug
    DESTINATION assets/03_Model_Loading
)