@echo off

echo c=%1 cxx=%2

cmake -G "MinGW Makefiles" -D CMAKE_C_COMPILER="%1" -D CMAKE_CXX_COMPILER="%2" "%CD%"

