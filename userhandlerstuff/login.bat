@echo off
break off
:start
cls
cd ..
cd users
dir /b

set /p user=Enter the name of your user:
if not exist "%user%\existance.hands" goto invalid-user
:password
:: hide password code begin
@echo off &setlocal

<nul set /p "=Password: "
call :HInput pw
setlocal EnableDelayedExpansion




:HInput [ByRef_VarName]
:: inspired by Carlos
:: improved by pieh-ejdsch
if "%__HI__%" neq "__HI__" (
  setlocal DisableDelayedExpansion
  set "S=" &set "N=0" &set "__HI__=__HI__"
  for /f %%i in ('"prompt;$h&for %%i in (1) do rem"') do set "BS=%%i"
)
set "C="
for /f "eol=1 delims=" %%i in ('xcopy /lwq "%~f0" :\') do set "C=%%i"
set "C=%C:~-1%"
setlocal EnableDelayedExpansion
if not defined C (
  echo(
  if "%~1"=="" (
    echo(!S!
    endlocal &endlocal &exit /b %N%
  ) else (
    if defined S (
      for /f delims^=^ eol^= %%i in ("!S!") do endlocal &endlocal &set "%~1=%%i" &exit /b %N%
    ) else endlocal &endlocal &set "%~1=" &exit /b 0
  )
)
if "!BS!"=="!C!" (
  set "C="
  if defined S set /a "N -= 1" &set "S=!S:~,-1!" &<nul set /p "=%BS% %BS%"
) else set /a "N += 1" &<nul set /p "=*"
if not defined S (
  endlocal &set "N=%N%" &set "S=%C%"
) else for /f delims^=^ eol^= %%i in ("!S!") do endlocal &set "N=%N%" &set "S=%%i%C%"
goto HInput
:: hide password code end
:invalid-user
Echo the user you enterd does not exist
echo please enter a valid user
goto start