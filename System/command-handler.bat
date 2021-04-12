@echo off
set CommandCheck=%Command%
for /f "tokens=1 delims= " %%a in ("%CommandCheck%") do (
    set CommandCheck=%%a
)



set currdir=%cd%
cd "%Systemdir%\Commands"
for %%F in (*) do (
    find "%%~nxF" "%Systemdir%\commandlist.txt" || del "%%~nxF"
) >nul
cd %currdir%

if "%CommandCheck%"=="dir" (
    goto dir 
) else if "%CommandCheck%"=="ls" (
    goto dir 
) 
if "%CommandCheck%"=="sakura" goto sakura
if "%CommandCheck%"=="?" goto ?
if not exist "%Systemdir%\Commands\%CommandCheck%.bat" (
    echo Command not found.
    goto eof
) else (
    call "%Systemdir%\Commands\%CommandCheck%.bat"
    echo command handler UwU
    pause+
    goto eof
)
pause
goto eof
:?
echo Avaliable Commands Are...
echo     Date Dir Echo Login Ls Register SHA512sum Time Users Whoami ?
goto eof

:sakura
start https://www.youtube.com/watch?v=jqpFjsMtCb0
echo ^%Zhara +star Sakura. good job
goto eof

:dir
if "%token%"=="8" (
    echo Permission Denied
    goto eof
) else if "%Token%"=="1" (
    echo Permission Denied
    goto eof
)

dir > "%Tempdir%\Dirprocess.tmp"
for /f "usebackq skip=4 delims=" %%A in ("%Tempdir%\Dirprocess.tmp") do >>"%Tempdir%\Dirprocess2.tmp" echo %%A
echo  Volume A>>"%Tempdir%\Dirprocess3.tmp"
echo  Directory of %ShowDir%>>"%Tempdir%\Dirprocess3.tmp"
echo.>>"%Tempdir%\Dirprocess3.tmp"
type "%Tempdir%\Dirprocess2.tmp">>"%Tempdir%\Dirprocess3.tmp"
type "%Tempdir%\Dirprocess3.tmp"
del "%Tempdir%\Dirprocess.tmp"
del "%Tempdir%\Dirprocess2.tmp"
del "%Tempdir%\Dirprocess3.tmp"
goto eof

:eof
exit /b