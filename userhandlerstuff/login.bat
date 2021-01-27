@echo off
:start
goto end-of-functions

:passhash 
echo %hashing% > pswd1
set filename=pswd1
setlocal enabledelayedexpansion
for /f "skip=1 delims=:" %%B in ('CertUtil -hashfile "%filename%" sha512') do (
set sha512=%%B"
)
set hashed=%sha512: =%
endlocal
del pswd1
:end-of-functions
if not exist "%sysdir%\users\%name%\User.bat" (
	set /p yn = User does not exist. Register new user? y/n: 
	if %yn% == 'n' (
		set /p name=Your name:
		goto start
	) else (
		set res = "4"
		call usr-handler.bat
	)
) else (
	set /p %hashing% == Password?
	call passhash
)
:eof