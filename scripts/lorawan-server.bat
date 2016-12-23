@echo off

setlocal EnableDelayedExpansion

set SCRIPT_DIR=%~dp0
for %%A in ("%SCRIPT_DIR%\..") do (
    set "ROOT_DIR=%%~fA"
)

for /D %%A in (%ROOT_DIR%\lib\*) do (
    set FILES=!FILES! %%A\ebin
)

cd %ROOT_DIR% && erl -noinput +Bd -sname lorawan -pa !FILES! -s lorawan_app -config releases/0.2.0/sys.config
