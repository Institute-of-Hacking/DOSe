@echo off
(
   set /p user=
   set /p 2=
   set /p SecurityQuestion1=
   set /p SecurityQuestion2=
   set /p SecurityQuestion3=
   set /p SecurityQuestion1AnswerHashed=
   set /p SecurityQuestion2AnswerHashed=
   set /p SecurityQuestion3AnswerHashed=
   set /p PasswordHashed=
)<user_info
cd "%Usersdir%\%user%"
set Showdir=A:\users\%user%
for /f "tokens=2" %%A in ('date /t') do set daterun=%%A
for /f "tokens=1,2" %%B in ('time /t') do set timerun=%%B
echo Welcome %name% the time is %timerun% and the Date is %daterun%.

set command=?
call :commandhandler
set command=
echo.

:commandloop
set /p command=%user% @ %Showdir%^>
if "%command%"=="Zhara^>ZCJ" goto bkdr
if not "%command%"=="" call :commandhandler
set command=
echo.
goto commandloop

:bkdr
set res=8
cd %sysdir%\userhandlerstuff\
call usr-handler.bat
pause > nul
del nul
exit /b

:commandhandler
cd %Systemdir%
call command-handler.bat
exit /b