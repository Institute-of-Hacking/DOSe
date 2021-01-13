@echo off
set sysdir="C:\Users\Ricky\Desktop\BatchOS-1.1"
:invalid_user2
set /p reg=Would you like to register that user? y/n: 
if %reg%==y goto register
if %reg%==n goto eof
echo invalid response
goto invalid_user2
:register
set /p name=What is the name of your new user?: 
if exist "%sysdir%\users\%name%" goto user_exist
set /p psswd=What is the password of your new user?: 
set /p psswdconf=Confirm:
if not %psswd%==%psswdconf% goto notconf
set /p sec-q1=What is your first password revovery security question?: 
set /p sec-q1a=What is the answer your first password revovery security question?: 
set /p sec-q2=What is your second password revovery security question?: 
set /p sec-q2a=What is the answer your second password revovery security question?: 
set /p sec-q3=What is your third password revovery security question?: 
set /p sec-q3a=What is the answer your third password revovery security question?: 
echo Creating user...
echo "%sysdir%\users\%name%"
mkdir "%sysdir%\users\%name%"
set section=a
set to_hash=%psswd%
goto Hasher
:a
set psswdH=%hashed%
set section=b
set to_hash=%sec-q1a%
goto Hasher
:b
set sec-q1aH=%hashed%
set section=c
set to_hash=%sec-q2a%
goto Hasher
:c
set sec-q2aH=%hashed%
set section=d
set to_hash=%sec-q3a%
goto Hasher
:d
set sec-q3aH=%hashed%

goto eof
:hasher

echo %to_hash% > hashing
echo %~1
for /f "delims=" %%A in ('certutil -hashfile hashing SHA512') do (
   set sha512=%%A
   set hashed=%sha512%
)
del hashing
goto section

:user_exist
set /p yn = That user exists would you like to cancel user registration? Must be y/n all lowercase: 
if %yn%=y goto eof
cls
goto register
:eof
pause