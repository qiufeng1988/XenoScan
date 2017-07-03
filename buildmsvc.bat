@if not defined INCLUDE (
	echo Must be run from a "Visual Studio Command Prompt"
) else (

if exist deps\\luajit\\src\\lua51.lib (
    echo NOT BUILDING LuaJIT BECAUSE lua51.lib ALREADY EXISTS.
    echo To force rebuild of LuaJIT, DELETE "deps\\luajit\\src\\lua51.lib"
    cd build && cmake -G %1 Win32 ..\\ && cd ..
) else (
	echo BUILDING LuaJIT BECAUSE lua51.lib DOESN'T EXISTS.
    cd deps\\luajit\\src && msvcbuild.bat && cd ..\\..\\..\\build && cmake -G %1 Win32 ..\\ && cd ..
)
)