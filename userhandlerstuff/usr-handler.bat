@echo off
if "%res%"="1" goto login
if "%res%"="2" goto pswd-reset
if "%res%"="3" goto usr-creation
if "%res%"="4" goto usr-deletion
if "%res%"="5" goto usr-controled-pswd-reset
if "%res%"="6" goto user-requests
if "%res%"="7" goto command-interpreter
goto ex

:login
call login.bat
goto ex1

:pswd-reset
:: very buggy
goto ex1

:usr-creation

call user-creator.bat
goto ex1

:usr-deletion
call user-deletion.bat
goto ex1

:usr-controled-pswd-reset
call usr-pswd-change.bat
goto ex1is 

:user-requests
call user-requests.bat
goto ex1

:command-interpreter
call interpreter.bat
goto ex1

:ex
cd errors
start reserr.vbs
exit /b

:ex1
