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
set Tempdir=%Systemdir%\Temp
set Utildir=%Systemdir%\util
set Version=DOSe 2.4
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
echo Created By %zcj%. Developed By %zcj% ^& %zhara%. Minor Improvements ^& Bug Testing By %ihaveroot%.
echo.
echo.
for /f "tokens=1" %%A in ('time /t') do set timerunA=%%A
for /f "tokens=2" %%B in ('time /t') do set timerunB=%%B
set timerun=%timerunA% %timerunB%
echo %version% Time Running : %timerun%, Date Running : %date%
echo.
echo.

set token=0
set user=Guest
set command=?
call :commandhandler
set command=
echo.

call :GetDIR

:commandloop
set command= 
set /p command=%user% @ %Showdir%^>

set "command=%command:"=SCETQ%"
set "command=%command:|=SCETP%"
set "command=%command:&=SCETAN%"
set "command=%command:@=SCETAT%"
set "command=%command:\=SCETB%"
set "command=%command:(=SCETPO%"
set "command=%command:)=SCETPT%"
set "command=%command::=SCETCO%"
set "command=%command:^=SCETCI%"

if not "%command%"==" " (
    call :commandhandler
) else (
    call :GetDIR
)
set command= 
echo.
goto commandloop

:commandhandler
call "%Systemdir%\command-handler.bat"
cd %Rootdir%
set token=0
set user=Guest
call :GetDIR
exit /b

:GetDIR
call "%Utildir%\Getdir.bat"
(
    set /p Showdir=
)<"%Tempdir%\CurrentDirectory.tmp"
del "%Tempdir%\CurrentDirectory.tmp"
exit /b