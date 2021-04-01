@ECHO off
echo [38;2;255;255;255m[48;2;0;0;0m
cls

:start
rem Making Color Table

set Console=[38;2;255;255;255m[48;2;0;0;0m
set red=[38;2;255;0;0m
set orange=[38;2;255;165;0m
set yellow=[38;2;255;255;0m
set green=[38;2;0;255;0m
set blue=[38;2;0;0;255m
set purple=[38;2;255;0;255m
set white=[38;2;255;255;255m
set black=[38;2;0;0;0m

rem Setting System Variables
set Rootdir=%cd%
set Systemdir=%Rootdir%\System
set Gamesdir=%Rootdir%\games
set Usersdir=%Rootdir%\users
set Showdir=A:\
set Utildir=%Rootdir%\util
set Version=DOSe 2.0
set zcj=%red%ZCJ%Console%
set zhara=%green%Zhara%Console%
set ihaveroot=%blue%ihaveroot%Console%


title %Version%
echo.
echo %red%      ##### ##    %green%      # ###    %blue%   #######             %Console%
echo %red%   /#####  /##    %green%    /  /###    %blue% /       ###           %Console%
echo %red% //    /  / ###   %green%   /  /  ###   %blue%/         ##           %Console%
echo %red%/     /  /   ###  %green%  /  ##   ###  %blue%##        #            %Console%
echo %red%     /  /     ### %green% /  ###    ### %blue% ###                   %Console%
echo %red%    ## ##      ## %green%##   ##     ## %blue%## ###        %red%   /##   %Console%
echo %red%    ## ##      ## %green%##   ##     ## %blue% ### ###      %red%  / ###  %Console%
echo %red%    ## ##      ## %green%##   ##     ## %blue%   ### ###    %orange% /   ### %Console%
echo %red%    ## ##      ## %green%##   ##     ## %blue%     ### /##  %orange%##    ###%Console%
echo %red%    ## ##      ## %green%##   ##     ## %blue%       #/ /## %yellow%######## %Console%
echo %red%    #  ##      ## %green% ##  ##     ## %blue%        #/ ## %green%#######  %Console%
echo %red%       /       /  %green%  ## #      /  %blue%         # /  %blue%##       %Console%
echo %red%  /###/       /   %green%   ###     /  %blue%/##        /   %blue%####    /%Console%
echo %red% /   ########/    %green%    ######/  %blue%/  ########/    %purple% ######/ %Console%
echo %red%/       ####      %green%      ###   %blue%/     #####      %purple%  #####  %Console%
echo %red%#                 %green%            %blue%^|                        %Console%
echo %red% ##               %green%             %blue%\)                       %Console%
echo Created By %zcj%. Developed By %zcj% ^& %zhara%. Minor Improvements By %ihaveroot%.
echo.
echo.
for /f "tokens=2" %%A in ('date /t') do set daterun=%%A
for /f "tokens=1,2" %%B in ('time /t') do set timerun=%%B
echo %version% Time Running : %timerun%, Date Running : %daterun%
echo.
echo.

set token=0
set user=Guest
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
set token=0
set user=Guest
exit /b