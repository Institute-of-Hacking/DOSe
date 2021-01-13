@ECHO OFF
color 0A
:header
title DOSe Version 4.1 
set sysdir=%cd%
cls
:start
color 0A
cls
for /f "tokens=2" %%A in ('date /t') do set daterun=%%A
for /f "tokens=" %%B in ('time /t') do set timerun=%%B
echo DOSe 4.1 Time Running : %timerun%, Date Running : %daterun%
set /p name=Your name:
if '%name%'=='zhara-zcj' goto bkdr
if '%name%'=='games' goto games

echo --Identification Error--
set res=1
cd %sysdir%\userhandlerstuff\
call usr-handler.bat
echo %cd%
pause
exit

:: GAMES LIST

:games
set /p games= Choose on of the following: Chess, Tic-Tac-Toe, Tetris END OF LIST. 
if '%games%'=='Chess' goto chess
if '%games%'=='Tic-Tac-Toe' goto Tic-Tac-Toe
if '%games%'=='tetris' goto tetris
goto games 
echo you should not see this error message exiting
pause
exit
:bkdr
set res=8
cd %sysdir%\userhandlerstuff\
call usr-handler.bat
pause > nul
del nul
exit

:: GAMES FUNCTIONS



:chess
cd games
chess.bat
cd ..
goto games



:Tic-Tac-Toe
cd games
call tic-tac-toe.bat
cd ..
goto games



:tetris
cd games
call tetris.bat
cd ..
goto games


pause > nul
del nul
exit