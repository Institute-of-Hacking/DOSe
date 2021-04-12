@echo off
set startdir=%cd%
set user=
set token=
set SecurityQuestion1=
set SecurityQuestion2=
set SecurityQuestion3=
set SecurityQuestion1AnswerHashed=
set SecurityQuestion2AnswerHashed=
set SecurityQuestion3AnswerHashed=
set PasswordHashed=
set Password=
:user
set /p user=Username?: 
choice /m "Your Username was '%user%' correct? Type E to exit 20 char length max: " /c:YNE
ECHO %user%>x&FOR %%? IN (x) DO SET /A usernamelength=%%~z? - 2&del x
if %usernamelength% GTR 20 (
   echo Your username is %usernamelength% characters long. The max it 20 please shorten it.
   goto user
)
if %usernamelength% LSS 1 (
   echo Your username is %usernamelength% characters long. The min it 1 please lengthen it.
   goto user
)
if exist "%usersdir%\%user%" (
   echo User exists.
   goto user
)
if "%ERRORLEVEL%"=="2" goto user
if "%ERRORLEVEL%"=="3" goto eof
if exist "%Usersdir%\%user%.bat" (
   echo User exists
   goto user
)

:Question1
set /p SecurityQuestion1=What is your first security question?: 
choice /m "Your question was '%SecurityQuestion1%' correct? Type E to exit: " /c:YNE
if "%ERRORLEVEL%"=="2" goto Question1
if "%ERRORLEVEL%"=="3" goto eof

:Answer1
set /p SecurityQuestion1Answer=What is the answer to your first security question?: 
choice /m "Your answer was '%SecurityQuestion1Answer%' correct? Type E to exit: " /c:YNE
if "%ERRORLEVEL%"=="2" goto Answer1
if "%ERRORLEVEL%"=="3" goto eof

:Question2
set /p SecurityQuestion2=What is your second security question?: 
choice /m "Your question was '%SecurityQuestion2%' correct? Type E to exit: " /c:YNE
if "%ERRORLEVEL%"=="2" goto Question2
if "%ERRORLEVEL%"=="3" goto eof

:Answer2
set /p SecurityQuestion2Answer=What is the answer to your second security question?: 
choice /m "Your answer was '%SecurityQuestion2Answer%' correct? Type E to exit: " /c:YNE
if "%ERRORLEVEL%"=="2" goto Answer2
if "%ERRORLEVEL%"=="3" goto eof

:Question3
set /p SecurityQuestion3=What is your third security question?: 
choice /m "Your question was '%SecurityQuestion3%' correct? Type E to exit: " /c:YNE
if "%ERRORLEVEL%"=="2" goto Question3
if "%ERRORLEVEL%"=="3" goto eof

:Answer3
set /p SecurityQuestion3Answer=What is the answer to your third security question?: 
choice /m "Your answer was '%SecurityQuestion3Answer%' correct? Type E to exit: " /c:YNE
if "%ERRORLEVEL%"=="2" goto Answer3
if "%ERRORLEVEL%"=="3" goto eof

:Password
set /p Password=Password?: 
choice /m "Your password was '%Password%' correct? Type E to exit: " /c:YNE
if "%ERRORLEVEL%"=="2" goto Password
if "%ERRORLEVEL%"=="3" goto eof

set hashing=%SecurityQuestion1Answer%
call "%Utildir%\hashing.bat"
set SecurityQuestion1AnswerHashed=%Hashed%

set hashing=%SecurityQuestion2Answer%
call "%Utildir%\hashing.bat"
set SecurityQuestion2AnswerHashed=%Hashed%

set hashing=%SecurityQuestion3Answer%
call "%Utildir%\hashing.bat"
set SecurityQuestion3AnswerHashed=%Hashed%

set hashing=%Password%
call "%Utildir%\hashing.bat"
set PasswordHashed=%Hashed%

mkdir "%usersdir%\%user%"
mkdir "%usersdir%\%user%\Desktop"
mkdir "%usersdir%\%user%\Documents"
cd "%usersdir%\%user%"
(
   echo %user%
   echo 2
   echo %SecurityQuestion1%
   echo %SecurityQuestion2%
   echo %SecurityQuestion3%
   echo %SecurityQuestion1AnswerHashed%
   echo %SecurityQuestion2AnswerHashed%
   echo %SecurityQuestion3AnswerHashed%
   echo %PasswordHashed%
)>user_info
copy "%Systemdir%\userfiles\user.bat" "%Usersdir%\%user%" >nul
if "%usernamelength%"=="1" set spaces=                   
if "%usernamelength%"=="2" set spaces=                  
if "%usernamelength%"=="3" set spaces=                 
if "%usernamelength%"=="4" set spaces=                
if "%usernamelength%"=="5" set spaces=               
if "%usernamelength%"=="6" set spaces=              
if "%usernamelength%"=="7" set spaces=             
if "%usernamelength%"=="8" set spaces=            
if "%usernamelength%"=="9" set spaces=           
if "%usernamelength%"=="10" set spaces=          
if "%usernamelength%"=="11" set spaces=         
if "%usernamelength%"=="12" set spaces=        
if "%usernamelength%"=="13" set spaces=       
if "%usernamelength%"=="14" set spaces=      
if "%usernamelength%"=="15" set spaces=     
if "%usernamelength%"=="16" set spaces=    
if "%usernamelength%"=="17" set spaces=   
if "%usernamelength%"=="18" set spaces=  
if "%usernamelength%"=="19" set spaces= 
for /f "tokens=2" %%A in ('date /t') do set date=%%A
set currdir=%cd%
echo ^| %date% ^| %user%%spaces% ^| >>"%systemdir%\usertable.usr"
cd %startdir%

echo.
echo %Green%DONE%Console%
echo.
:eof
set user=
set token=
set SecurityQuestion1=
set SecurityQuestion2=
set SecurityQuestion3=
set SecurityQuestion1AnswerHashed=
set SecurityQuestion2AnswerHashed=
set SecurityQuestion3AnswerHashed=
set PasswordHashed=
set Password=s
exit /b