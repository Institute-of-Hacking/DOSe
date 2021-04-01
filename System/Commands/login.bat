:start
dir /b "%usersdir%"
set /p user=User?: 
if exist "%usersdir%\%user%" (
	goto login
) else (
	set /p yn=User does not exist. Register new user? y/n: 
	if "%yn%"=="n" (
		goto eof
	) else (
		set command=Register
		call "%Systemdir%\command-handler.bat"
	)
)
echo %hashed%
pause

:login
set /p hashing=Password?: 
choice /m "Your password was '%hashing%' correct? "
if %ERRORLEVEL%=="2" goto login
call "%Utildir%\Hashing.bat"
cd "%Usersdir%\%user%"
(
   set /p user=
   set /p 2=
   set /p SecurityQuestion1=
   set /p SecurityQuestion2=
   set /p SecurityQuestion3=
   set /p SecurityQuestion1AnswerHashed=
   set /p SecurityQuestion2AnswerHashed=
   set /p SecurityQuestion3AnswerHashed=
   set /p PasswordHashed=
)<user_info
if not %hashed%==%hash% (
	echo Incorrect Password.
	echo.
	goto login
	goto eof
) else (
	cls
	cd "%usersdir%\%user%"
	call "user.bat"
	goto eof
)
:eof
pause
exit /b