@ECHO OFF
color 0A
:header
title DOSe Version 4.0 
cls
goto start

*********************************************************************************************
:: START

:start
color 0F
cls
set /p name=Your name:
if '%name%'=='zhara-zcj' goto bkdr
if '%name%'=='games' goto games

echo --Identification Error--
pause > nul
del nul
cd users
call login.bat

:: GAMES LIST

:games
set /p games= Choose on of the following: Chess, Tic-Tac-Toe, Tetris END OF LIST. 
if '%games%'=='Chess' goto chess
if '%games%'=='Tic-Tac-Toe' goto Tic-Tac-Toe
if '%games%'=='tetris' goto tetris
goto games 
pause

:bkdr
set res=8
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
