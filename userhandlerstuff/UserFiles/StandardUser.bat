@echo off
(
    set /p token =
    set /p passhash =
    set /p name =
)<"user_info"
for /f "tokens=2" %%A in ('date /t') do set daterun=%%A
for /f "tokens=" %%B in ('time /t') do set timerun=%%B
echo Welcome %name% the time is %timerun% and the Date is %daterun%.
set command = ?
call "%sysdir%\userhandlerstuff\command-handler.bat"
:commandLoop
set /p command = %cd%\^>
call "%sysdir%\userhandlerstuff\command-handler.bat"
goto commandLoop