@echo off
pushd %~dp0\..\

@REM ------------- clean project :
rd /s /Q _install
rd /s /Q build
rd /s /Q .cache\build_clangd

@REM ------------- if use Ninja(MSVC) : 
@REM call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"
@REM cmake -S . -B .\build -G "Ninja" -DCMAKE_BUILD_TYPE=Release
@REM cmake --build .\build --config Release --target "install"


@REM ------------- if use MSVC
cmake -S . -B .\build -DCMAKE_BUILD_TYPE=Release
cmake --build .\build --config Release --target "install" -- "-m:12"


@REM ------------- for easier to clangd with msvc
@REM cmake -DCMAKE_TRY_COMPILE_TARGET_TYPE="STATIC_LIBRARY" -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -S . -B .cache/build_clangd -G "Unix Makefiles"
copy .cache\build_clangd\compile_commands.json build
@REM ------------- ctrl+shift+p > clangd: Restart langue server

popd
pause
