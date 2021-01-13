@echo off
if command == "sakura" goto sakura
if not exist "%command%.bat" (
    echo Command not found check spelling
    goto eof
) else (
    call "%command%.bat"
    goto eof
)


:sakura
start https://www.youtube.com/watch?v=jqpFjsMtCb0
echo ^%Zhara +star Sakura. good job
echo zcj is not allowed to get this badge due to him being a person who will see this
:eof
exit