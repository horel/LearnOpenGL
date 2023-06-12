# ---- each chapter ----
add_subdirectory(01_Depth_Testing)
add_subdirectory(02_Stencil_Testing)

# ---- Assets install ----
file(GLOB assets_04_Advanced_OpenGL assets/*)
install(FILES ${assets_04_Advanced_OpenGL}
    CONFIGURATIONS Release Debug
    DESTINATION assets/04_Advanced_OpenGL
)