@echo off
call :load

if "%AccessDenied%"=="true" goto accessdenied
echo.
echo.
cd "%Usersdir%\%user%"
set Showdir=A:\users\%user%

for /f "tokens=2" %%A in ('date /t') do set daterun=%%A
for /f "tokens=1" %%B in ('time /t') do set timerunA=%%B
for /f "tokens=2" %%C in ('time /t') do set timerunB=%%C
set timerun=%timerunA% %timerunB%
echo Welcome %user% the time is %timerun% and the Date is %daterun%.

set command=?
call :commandhandler
set command=
echo.

:commandloop
call :check
if "%AccessDenied%"=="true" goto accessdenied
set /p command=%user% @ %Showdir%^>
if not "%command%"=="" call :commandhandler
set command=
echo.
goto commandloop

:commandhandler
if "%AccessDenied%"=="true" goto accessdenied
call "%Systemdir%\command-handler.bat"
call :load
exit /b

:check
if not exist "%tempdir%\LoginLog.txt" (
    set AccessDenied=true
) else (
    (
        set /p invalidA=
        set /p Hashed=
        set /p invalidB=
        set /p hasha=
        set /p hashb=
        set /p hashc=
        set /p hashd=
    )<"%tempdir%\LoginLog.txt"
)


if not "%Hasha%"=="%SecurityQuestion1AnswerHashed%%user%" set AccessDenied=true
if not "%Hashb%"=="%SecurityQuestion2AnswerHashed%%user%" set AccessDenied=true
if not "%Hashc%"=="%SecurityQuestion3AnswerHashed%%user%" set AccessDenied=true
if not "%Hashd%"=="%PasswordHashed%" set AccessDenied=true
if not "%Hashed%"=="%PasswordHashed%" set AccessDenied=true
if not "%LoginSectionA%"=="p%version%%user%" set AccessDenied=true
if not "%LoginSectionB%"=="p%version%%user%" set AccessDenied=true
if not "%LoginSectionC%"=="p%version%%invalidA%%Hashed%%invalidB%%user%" set AccessDenied=true
if not "%LoginSectionD%"=="p%version%%user%" set AccessDenied=true
if not "%LoginSectionE%"=="p%version%%user%" set AccessDenied=true

ECHO %hasha%%user%>x&FOR %%? IN (x) DO SET /A hashalength=%%~z? - 2&del x
ECHO %hashb%%user%>x&FOR %%? IN (x) DO SET /A hashblength=%%~z? - 2&del x
ECHO %hashc%%user%>x&FOR %%? IN (x) DO SET /A hashclength=%%~z? - 2&del x
ECHO %hashd%%user%>x&FOR %%? IN (x) DO SET /A hashdlength=%%~z? - 2&del x
ECHO %SecurityQuestion1AnswerHashed%%user%>x&FOR %%? IN (x) DO SET /A sq1ahlength=%%~z? - 2&del x
ECHO %SecurityQuestion2AnswerHashed%%user%>x&FOR %%? IN (x) DO SET /A sq2ahlength=%%~z? - 2&del x
ECHO %SecurityQuestion3AnswerHashed%%user%>x&FOR %%? IN (x) DO SET /A sq3ahlength=%%~z? - 2&del x
ECHO %PasswordHashed%>x&FOR %%? IN (x) DO SET /A passhlength=%%~z? - 2&del x
ECHO %LoginSectionA%%user%>x&FOR %%? IN (x) DO SET /A lsalength=%%~z? - 2&del x
ECHO %LoginSectionB%%user%>x&FOR %%? IN (x) DO SET /A lsblength=%%~z? - 2&del x
ECHO %LoginSectionC%%user%>x&FOR %%? IN (x) DO SET /A lsclength=%%~z? - 2&del x
ECHO %LoginSectionD%%user%>x&FOR %%? IN (x) DO SET /A lsdlength=%%~z? - 2&del x
ECHO %LoginSectionE%%user%>x&FOR %%? IN (x) DO SET /A lselength=%%~z? - 2&del x
ECHO p%version%%user%>x&FOR %%? IN (x) DO SET /A pvlength=%%~z? - 2&del x
ECHO p%version%%invalidA%%Hashed%%invalidB%%user%>x&FOR %%? IN (x) DO SET /A pvihilength=%%~z? - 2&del x
ECHO %Hashed%>x&FOR %%? IN (x) DO SET /A hashedlength=%%~z? - 2&del x
ECHO %user%>x&FOR %%? IN (x) DO SET /A UNlength=%%~z? - 2&del x

set /a hashalength=%hashalength% - %UNlength% - %UNlength%
set /a hashblength=%hashblength% - %UNlength% - %UNlength%
set /a hashclength=%hashclength% - %UNlength% - %UNlength%
set /a hashdlength=%hashdlength% - %UNlength%
set /a sq1ahlength=%sq1ahlength% - %UNlength%
set /a sq2ahlength=%sq2ahlength% - %UNlength%
set /a sq3ahlength=%sq3ahlength% - %UNlength%
set /a lsalength=%lsalength% - %UNlength% - %UNlength%
set /a lsblength=%lsblength% - %UNlength% - %UNlength%
set /a lsclength=%lsclength% - %UNlength% - %UNlength%
set /a lsdlength=%lsdlength% - %UNlength% - %UNlength%
set /a lselength=%lselength% - %UNlength% - %UNlength%
set /a pvlength=%pvlength% - %UNlength%
set /a pvihilength=%pvihilength% - %UNlength%

if not "%hashalength%"=="128" set AccessDenied=true
if not "%hashblength%"=="128" set AccessDenied=true
if not "%hashclength%"=="128" set AccessDenied=true
if not "%hashdlength%"=="128" set AccessDenied=true
if not "%sq1ahlength%"=="128" set AccessDenied=true
if not "%sq2ahlength%"=="128" set AccessDenied=true
if not "%sq3ahlength%"=="128" set AccessDenied=true
if not "%passhlength%"=="128" set AccessDenied=true
if not "%lsalength%"=="9" set AccessDenied=true
if not "%lsblength%"=="9" set AccessDenied=true
if not "%lsclength%"=="219" set AccessDenied=true
if not "%lsdlength%"=="9" set AccessDenied=true
if not "%lselength%"=="9" set AccessDenied=true
if not "%pvlength%"=="9" set AccessDenied=true
if not "%pvihilength%"=="219" set AccessDenied=true
if not "%hashedlength%"=="128" set AccessDenied=true

if not "%AccessDenied%"=="true" (
    if "%hasha%"=="%hashb%" (
        set AccessDenied=true
    ) else if "%hasha%"=="%hashc%" (
        set AccessDenied=true
    ) else if "%hasha%"=="%hashd%" (
        set AccessDenied=true
    ) else if not "%hasha%"=="%SecurityQuestion1AnswerHashed%%user%" (
        set AccessDenied=true
    ) else if "%hasha%"=="%SecurityQuestion2AnswerHashed%%user%" (
        set AccessDenied=true
    ) else if "%hasha%"=="%SecurityQuestion3AnswerHashed%%user%" (
        set AccessDenied=true
    ) else if "%hasha%"=="%PasswordHashed%" (
        set AccessDenied=true
    ) else if "%hasha%"=="%Hashed%" (
        set AccessDenied=true
    ) else if "%hashb%"=="%hashc%" (
        set AccessDenied=true
    ) else if "%hashb%"=="%hashd%" (
        set AccessDenied=true
    ) else if "%hashb%"=="%SecurityQuestion1AnswerHashed%%user%" (
        set AccessDenied=true
    ) else if not "%hashb%"=="%SecurityQuestion2AnswerHashed%%user%" (
        set AccessDenied=true
    ) else if "%hashb%"=="%SecurityQuestion3AnswerHashed%%user%" (
        set AccessDenied=true
    ) else if "%hashb%"=="%PasswordHashed%" (
        set AccessDenied=true
    ) else if "%hashb%"=="%Hashed%" (
        set AccessDenied=true
    ) else if "%hashc%"=="%hashd%" (
        set AccessDenied=true
    ) else if "%hashc%"=="%SecurityQuestion1AnswerHashed%%user%" (
        set AccessDenied=true
    ) else if "%hashc%"=="%SecurityQuestion2AnswerHashed%%user%" (
        set AccessDenied=true
    ) else if not "%hashc%"=="%SecurityQuestion3AnswerHashed%%user%" (
        set AccessDenied=true
    ) else if "%hashc%"=="%PasswordHashed%" (
        set AccessDenied=true
    ) else if "%hashc%"=="%Hashed%" (
        set AccessDenied=true
    ) else if "%hashd%"=="%SecurityQuestion1AnswerHashed%%user%" (
        set AccessDenied=true
    ) else if "%hashd%"=="%SecurityQuestion2AnswerHashed%%user%" (
        set AccessDenied=true
    ) else if "%hashd%"=="%SecurityQuestion3AnswerHashed%%user%" (
        set AccessDenied=true
    ) else if not "%hashd%"=="%PasswordHashed%" (
        set AccessDenied=true
    ) else if not "%hashd%"=="%Hashed%" (
        set AccessDenied=true
    ) else if not "%LoginSectionA%"=="%LoginSectionB%" (
        set AccessDenied=true
    ) else if "%LoginSectionA%"=="%LoginSectionC%" (
        set AccessDenied=true
    ) else if not "%LoginSectionA%"=="%LoginSectionD%" (
        set AccessDenied=true
    ) else if not "%LoginSectionA%"=="%LoginSectionE%" (
        set AccessDenied=true
    ) else if "%LoginSectionB%"=="%LoginSectionC%" (
        set AccessDenied=true
    ) else if not "%LoginSectionB%"=="%LoginSectionD%" (
        set AccessDenied=true
    ) else if not "%LoginSectionB%"=="%LoginSectionE%" (
        set AccessDenied=true
    ) else if "%LoginSectionC%"=="%LoginSectionD%" (
        set AccessDenied=true
    ) else if "%LoginSectionC%"=="%LoginSectionE%" (
        set AccessDenied=true
    ) else if not "%LoginSectionD%"=="%LoginSectionE%" (
        set AccessDenied=true
    )
)
exit /b

:Load
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
)<user_info
call :check
exit /b

:accessdenied
set LoginSectionA=
set LoginSectionB=
set LoginSectionC=
set LoginSectionD=
set LoginSectionE=
set hashalength=
set hashblength=
set hashclength=
set hashdlength=
set sq1ahlength=
set sq2ahlength=
set sq3ahlength=
set lsalength=
set lsblength=
set lsclength=
set lsdlength=
set lselength=
set pvlength=
set pvihilength=
echo =========================================
echo.
echo.
echo.
echo ----========= Access %red%Denied%console% =========----
echo.
echo.
echo.
echo =========================================
set command=
goto eof

:eof
exit /b