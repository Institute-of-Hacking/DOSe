@echo off
echo %cd%
if "%res%"=="1" (
    call login.bat
)
if "%res%"=="2" (
    call Reset.bat
)
if "%res%"=="3" (
    set token=5
    call "%sysdir%\users\root\user.bat"
)
if "%res%"=="4" (
    call reset.bat
)
:eof
