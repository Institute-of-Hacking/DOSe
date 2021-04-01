@echo off
:user
set /p user=Username?: 
choice /m "Your Username was '%user%' correct? Y/n: "
if %ERRORLEVEL%=="2" goto user

:Qestion1
set /p SecurityQuestion1=What is your first security question?: 
choice /m "Your question was '%SecurityQuestion1%' correct? Y/n: "
if %ERRORLEVEL%=="2" goto Question1

:Answer1
set /p SecurityQuestion1Answer=What is the answer to your first security question?: 
choice /m "Your answer was '%SecurityQuestion1Answer%' correct? Y/n: "
if %ERRORLEVEL%=="2" goto Answer1

:Qestion2
set /p SecurityQuestion2=What is your second security question?: 
choice /m "Your question was '%SecurityQuestion2%' correct? Y/n: "
if %ERRORLEVEL%=="2" goto Question2

:Answer2
set /p SecurityQuestion2Answer=What is the answer to your second security question?: 
choice /m "Your answer was '%SecurityQuestion2Answer%' correct? Y/n: "
if %ERRORLEVEL%=="2" goto Answer2

:Qestion3
set /p SecurityQuestion3=What is your third security question?: 
choice /m "Your question was '%SecurityQuestion3%' correct? /m Y/n: "
if %ERRORLEVEL%=="2" goto Question3

:Answer3
set /p SecurityQuestion3Answer=What is the answer to your third security question?: 
choice /m "Your /m answer /m was /m '%SecurityQuestion3Answer%' /m correct? /m Y/n: "
if %ERRORLEVEL%=="2" goto Answer3

:Password
set /p Password=Password?: 
choice /m "Your password was '%Password%' correct? Y/n: "
if %ERRORLEVEL%=="2" goto Password

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
copy "%Systemdir%\userfiles\user.bat" "%Usersdir%\%user%"
cd %Rootdir%
echo.
echo %Green%DONE%Console%
echo.
:eof