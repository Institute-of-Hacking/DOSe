@echo off

goto end-of-functions

:passhash 
echo %hashing% > pswd1
set filename=pswd1
setlocal enabledelayedexpansion
set /a count=1
for /f "skip=1 delims=:" %%B in ('CertUtil -hashfile "%filename%" sha512') do (
if !count! equ 1 set "sha512=%%B"
set /a count+=1
)
set "sha512=%sha512: =%
set hashed=%sha512%
endlocal
del pswd1
goto %place%
:hmm2"
:end-of-functions

:user check start
if not exist "%sysdir%\users\%name%\user-info" goto invalid_user else (
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
	if permission==4 if not exist "%sysdir%\users\%name%\admin.bat" goto invalid_user else set usr_type = admin.bat
	if permission==5 if not exist "%sysdir%\users\%name%\root.bat" goto invalid_user else set usr_type = root.bat
)
:user check end
:start
set /p %pass%=Enter the password for %name%: 

set "sha512=%sha512: =%
:hmm"
set reg-psswd=%sha512%
endlocal
del pswd1
attrib +R user_info
attrib +H user_info
attrib +S user_info
attrib +I user_info
if passhash==%reg-psswd% goto login_succ else goto invalid_pass
:login_succ
call %usr_type%.bat
goto eof
:invalid_pass
echo %Password invalid.
set /p yn=Would you like to recover your password?
if yn==y goto revovery else goto start
pause
goto eof 
:invalid_user
echo That user does not exist
:invalid_user2
call registeruser.bat
:eof