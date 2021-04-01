@echo off
if "%command%"=="dir" (
    goto dir 
) else if "%command%"=="ls" (
    goto dir 
) 
if "%command%"=="sakura" goto sakura
if "%command%"=="?" goto ?
if not exist "commands\%command%.bat" (
    echo Command not found.
    goto eof
) else (
    call "commands\%command%.bat"
    goto eof
)

:?
echo Avaliable Commands Are...
echo     Date Dir Login Register Time Whoami ?
goto eof

:sakura
start https://www.youtube.com/watch?v=jqpFjsMtCb0
echo ^%Zhara +star Sakura. good job
goto eof

:dir
dir
goto eof

:eof