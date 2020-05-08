@echo off
set /p token=Whats the perm level for the user(1-5):
if "%usrtoken%"="1" goto no
if "%usrtoken%"="2" goto no
if "%usrtoken%"="3" goto no
if "%usrtoken%"="4" goto tok4
if "%usrtoken%"="5" goto tok5
cd..
cd errors
start err3.vbs
exit

:no
echo just no you dont haver the perms just (sigh) just no
exit

:tok4
set /p usr=who are you deleting:
cd..
cd users
if not exist "users\%usr%\existance.

