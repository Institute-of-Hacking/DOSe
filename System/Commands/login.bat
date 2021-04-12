@echo off
:start
type "%systemdir%\usertable.usr"
set /p user=User?: 
set LoginSectionA=p%version%%user%
if exist "%usersdir%\%user%" (
	
	goto login
)
choice /m "User does not exist. Register new user? Type E to exit: " /c:YNE
if "%ERRORLEVEL%"=="1" (
	set command=Register
	call "%Systemdir%\command-handler.bat"
)
if "%ERRORLEVEL%"=="2" goto start
if "%ERRORLEVEL%"=="3" goto eof

:login
set LoginSectionB=p%version%%user%
set /p hashing=Password?: 
choice /m "Your password was '%hashing%' correct? "
if %ERRORLEVEL%=="2" goto login
call "%Utildir%\Hashing.bat"
set LoginSectionD=p%version%%user%
cd "%Usersdir%\%user%"
(
   set /p user=
   set /p Token=
   set /p SecurityQuestion1=
   set /p SecurityQuestion2=
   set /p SecurityQuestion3=
   set /p SecurityQuestion1AnswerHashed=
   set /p SecurityQuestion2AnswerHashed=
   set /p SecurityQuestion3AnswerHashed=
   set /p PasswordHashed=
) <user_info
if not %hashed%==%PasswordHashed% (
	set LoginSectionE=f%version%%user%
	echo Incorrect Password.
	echo.
	goto login
	goto eof
) else (
	set LoginSectionE=p%version%%user%
	(
		echo %SecurityQuestion1AnswerHashed%%user%
		echo %SecurityQuestion2AnswerHashed%%user%
		echo %SecurityQuestion3AnswerHashed%%user%
		echo %PasswordHashed%
	) >>"%Tempdir%\LoginLog.txt"
	cd "%usersdir%\%user%"
	call "user.bat"
	goto eof
)
:eof
exit /b