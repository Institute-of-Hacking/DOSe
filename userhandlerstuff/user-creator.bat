@echo off
set /p token=Whats the perm level for the user(1-5):
if "%usrtoken%"="1" goto tok1
if "%usrtoken%"="2" goto tok2
if "%usrtoken%"="3" goto tok3
if "%usrtoken%"="4" goto tok4
if "%usrtoken%"="5" goto tok5
cd..
cd errors
start err2.vbs
exit

:tok1
echo you are the useless guest i know you want to do good things but you cant even get a user account i mean you are trying but still you are just a disapointment.
pause > nul
del nul
goto ex

:tok2
echo you are a low priv bitch leave now we dont like you we dont want you to exist so leave b4 we kill you and take your family for food processing.
pause > nul
del nul
goto ex

:tok3
echo you are standard. you can make nothing
pause > nul
del nul
goto ex

:tok4
echo you are admin.
set /p token=what user perms do you want to make 1-5:
if "%token%"=1 goto gst-usr
if "%token%"=2 echo perms granted
if "%token%"=2 goto usr-standard
if "%token%"=3 echo perms granted
if "%token%"=3 goto usr-admin
if "%token%"=4 goto no-perms
if "%token%"=5 goto no-perms
pause > nul
del nul
goto ex


:tok5
echo you are root.
set /p token=what user perms do you want to make 1-5:
if "%token%"=1 goto gst-usr
if "%token%"=2 echo perms granted
if "%token%"=2 goto usr-low-priv
if "%token%"=3 echo perms granted
if "%token%"=3 goto usr-standard
if "%token%"=4 echo perms granted
if "%token%"=4 goto usr-admin
if "%token%"=5 echo perms granted
if "%token%"=5 goto usr-root
pause > nul
del nul
goto ex


:gst-usr
echo guest already exists.
pause > nul
del nul
goto ex

:no-perms
echo you do not have permission to make a user with that permission level.
pause > nul
del nul
goto ex

:usr-standard
set /p usr-nam=whats the name of the user:
cd ..
cd users
mkdir "%usr-nam%"
cd ..
copy "standard-usr.bat" "users\%usr-nam%"
copy existance.bat "users\%usr-nam%"
cls
echo done.
pause > nul
del nul
goto ex

:usr-low-priv
set /p usr-nam=whats the name of the user:
cd ..
cde users
mkdir "%usr-nam%"
cd ..
copy "low-priv-usr.bat" users\"%usr-nam%"
copy existance.bat "users\%usr-nam%"
cls
echo done.
pause > nul
del nul
goto ex

:usr-admin
set /p usr-nam=whats the name of the user:
cd ..
cde users
mkdir "%usr-nam%"
cd ..
copy "admin-usr.bat" users\"%usr-nam%"
copy existance.bat "users\%usr-nam%"
cls
echo done.
pause > nul
del nul
goto ex

:usr-root
set /p usr-nam=whats the name of the user:
cd ..
cde users
mkdir "%usr-nam%"
cd ..
copy "root-usr.bat" users\"%usr-nam%"
copy existance.bat "users\%usr-nam%"
cls
echo done.
pause > nul
del nul