# glad - 4.3 - Core
# https://glad.dav1d.de/

set(CMAKE_POSITION_INDEPENDENT_CODE ON)

set(GLAD_SOURCES "src/glad.c")

add_library(glad STATIC
    ${GLAD_SOURCES}
)
add_library(glad::glad ALIAS glad)

target_include_directories(glad
PUBLIC
    ./include/
)