@echo off
pushd %~dp0\..\

rd /s /Q _install
rd /s /Q build

@REM rd /s /Q .cache/build_clangd

popd
pause