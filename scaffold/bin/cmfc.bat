@echo off

erase /S /Q %cd%\.cache %cd%\.cmake %cd%\CMakeFiles %cd%\build %cd%\CMakeCache.txt %cd%\cmake_install.cmake %cd%\compile_commands.json %cd%\Makefile

rmdir /S /Q %cd%\.cache %cd%\.cmake %cd%\CMakeFiles
