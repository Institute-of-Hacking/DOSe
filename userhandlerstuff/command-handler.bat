@echo off
if command == "sakura" goto sakura
if not exist "commands\%command%.bat" (
    echo Command not found check spelling
    goto eof
) else (
    call "commands\%command%.bat"
    goto eof
)


:sakura
start https://www.youtube.com/watch?v=jqpFjsMtCb0
echo ^%Zhara +star Sakura. good job
:eof