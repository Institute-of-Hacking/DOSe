@echo off

goto end of functions

:passhash
echo %reg-pssws% > pswd1
set filename=pswd1
setlocal enabledelayedexpansion
set /a count=1
for /f "skip=1 delims=:" %%B in ('CertUtil -hashfile "%filename%" sha512') do (
if !count! equ 1 set "sha512=%%B"
set/a count+=1
)
set "sha512=%sha512: =%
set reg-psswd=%sha512%
endlocal
del pswd1
goto %place%

:end of functions

if "%tok%"="0" goto reg
set /p token=Whats the perm level for the user(1-5):
if "%tok%"="0" goto reg
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
echo %Missing Permission.
pause > nul
del nul
goto ex

:tok2
echo %Missing Permission.
pause > nul
del nul
goto ex

:tok3
echo %Missing Permission.
pause > nul
del nul
goto ex

:tok4
echo %Permission Granted.
echo 2 = low-priv
echo 3 = standard
set /p token=what user perms do you want to make 2-3:
if "%token%"=1 goto gst-usr
if "%token%"=2 echo perms granted
if "%token%"=2 goto usr-low-priv
if "%token%"=3 echo perms granted
if "%token%"=3 goto usr-standard
if "%token%"=4 goto no-perms
if "%token%"=5 goto no-perms
pause > nul
del nul
goto ex


:tok5
echo %permission granted
echo 2 = low-priv
echo 3 = standard
echo 4 = admin
echo 5 = root
set /p token=what user perms do you want to make 2-5:
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
pause
goto eof

:no-perms
echo you do not have permission to make a user with that permission level.
pause
goto eof

:usr-low-priv
set /p name=What is the name of the user?: 
set /p pass=What is the password of the user?: 
set place=5
goto passhash
:5
mkdir "%sysdir%\users\%name%"
(
echo 2
echo %pass%
echo %name%
)>user_info
cp "%sysdir%\userhandlerstuff\userfiles\low-priv.bat" "%sysdir%\users\%name%\"
goto eof

:usr-standard
set /p name=What is the name of the user?: 
set /p pass=What is the password of the user?: 
set place=5
goto passhash
:5
mkdir "%sysdir%\users\%name%"
(
echo 3
echo %pass%
echo %name%
)>user_info
cp "%sysdir%\userhandlerstuff\userfiles\standard.bat" "%sysdir%\users\%name%\"
goto eof

:usr-admin
set /p name=What is the name of the user?: 
set /p pass=What is the password of the user?: 
set place=5
goto passhash
:5
mkdir "%sysdir%\users\%name%"
(
echo 4
echo %pass%
echo %name%
)>user_info
cp "%sysdir%\userhandlerstuff\userfiles\admin.bat" "%sysdir%\users\%name%\"
goto eof

:usr-root
set /p name=What is the name of the user?: 
set /p pass=What is the password of the user?: 
set place=5
goto passhash
:5
mkdir "%sysdir%\users\%name%"
(
echo 5
echo %pass%
echo %name%
)>user_info
cp "%sysdir%\userhandlerstuff\userfiles\root.bat" "%sysdir%\users\%name%\"
:eof