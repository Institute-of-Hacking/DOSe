goto endoffunctions
:Hash
CertUtil -hashfile "%file%" SHA512 > Hashing
(
    set /p invalidA=
    set /p Hash=
    set /p invalidB=
)<Hashing
:endoffunctions
@echo off
set String=%command% sfc
set String=%String:~4,-4%

if "%String%"=="--ALL" goto all
if "%String%"=="-A" goto all


goto eof

:all
set file="%Rootdir%\%version%.bat"
call :Hash
if not "%Hash%"=="681ac3089deaa9f43f77f8dd19dcd99e27aff89505355a1076ca93b80272d95487d6c1adc20d45be760b10b09f18016e7231c82f296447f3523a2b7668f3af9f" (
    echo %version%.bat %red%FAILED%Console% Verification.
    echo Repairing.
    del "%Rootdir%\%version%.bat"
    copy "%Systemdir%\sfc\%version%.bat" "%Rootdir%"
    echo.
)

set file="%Systemdir%\command-handler.bat"
call :Hash
if not "%Hash%"=="85988306a1ea7037901f931fa9fd751b7208deb61eef452a8f636796dfc37e5066a39d195a0fa25a7ac2526e098eaacef9f163e51f116e95d11b0103aecfe654" (
    echo %version%.bat %red%FAILED%Console% Verification.
    echo Repairing.
    del "%Rootdir%\%version%.bat"
    copy "%Systemdir%\sfc\%version%.bat" "%Rootdir%"
    echo.
)

:eof