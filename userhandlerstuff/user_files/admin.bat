REM very early user file for a class 3 user. Don't expect this to work.
@echo off
title BatchOS
echo Welcome to BatchOS!
echo
echo "Today is " %DATE%
:cmd
set /p cmd=bOS>
%cmd%
goto cmd
