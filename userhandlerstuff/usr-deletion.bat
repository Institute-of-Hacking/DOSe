@echo off
set /p token=Whats the perm level for the user(1-5):
if "%usrtoken%"="1" goto eof
if "%usrtoken%"="2" goto eof
if "%usrtoken%"="3" goto eof
if "%usrtoken%"="4" goto tok4
if "%usrtoken%"="5" goto tok5
:no
echo token error exiting
echo if this error persists recreate user profile
pause
exit
:tok4
set /p usr=who are you deleting:
cd %sysdir%\users\
if not exist "%cd%\%usr%\" goto invalid_user
if not exist "%cd%\%usr%\user_info" goto invalid_user else {
	(
	set /p permission=
	set /p passhash=
	set /p name=
	)<"%sysdir%\users\%name%\user_info"
	if permission=="" goto invalid_user
	if passhash=="" goto invalid_user
	if name=="" goto invalid_user
	if permission==1 if not exist "%sysdir%\users\%name%\gst-usr.bat" goto invalid_user else set usr_type = gst_usr.bat
	if permission==2 if not exist "%sysdir%\users\%name%\low-priv.bat" goto invalid_user else set usr_type = low_priv.bat
	if permission==3 if not exist "%sysdir%\users\%name%\standard.bat" goto invalid_user else set usr_type = standard.bat
	if permission==4 if not exist goto missing_perms
	if permission==5 if not exist goto missing_perms
}
echo deleting user...
del /f /s /q "%cd%\%usr%\"
echo user deleted
pause
goto eof
:missing_perms
echo missing permissions exiting
pause
:eof

