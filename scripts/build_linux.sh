#!/bin/bash

PARENT_DIR=$(cd $(dirname $0);cd ..; pwd)

rm -rf ${PARENT_DIR}/build
rm -rf ${PARENT_DIR}/_install

cmake -S ${PARENT_DIR} -B ${PARENT_DIR}/build -G "Ninja" -DCMAKE_BUILD_TYPE=Release -DASSIMP_WARNINGS_AS_ERRORS=OFF
cmake --build ${PARENT_DIR}/build --config Release --target "install"