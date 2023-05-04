project(CTest VERSION 0.0.1 LANGUAGES CXX)
# TODO
message(STATUS "[__WARN__] NO TESTS NOW!")
message(STATUS "[__WARN__] It is simply to make it easier for me to [Launch] on VSCode.")

# -------------------------------------------
# The following is not used, 
# it is simply to make it easier for me
# to [Launch] on VSCode.
# -------------------------------------------
file(GLOB assets_01_Getting_started ${LEARN_GL_ROOT_DIR}/01_Getting_started/assets/*)

# MSVC
install(FILES ${assets_01_Getting_started}
    CONFIGURATIONS Release Debug
    DESTINATION ${LEARN_GL_ROOT_DIR}/build/01_Getting_started/assets/01_Getting_started/
)
# Ninja / GCC / Clang
install(FILES ${assets_01_Getting_started}
    CONFIGURATIONS Release Debug
    DESTINATION ${LEARN_GL_ROOT_DIR}/build/assets/01_Getting_started/
)