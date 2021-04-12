if "%Token%"=="0" (
    echo Permission Denied
    goto eof
) else if "%Token%"=="1" (
    echo Permission Denied
    goto eof
)

:dirchoice
set /p directory=Directory?: 
if "%directory%"=="" (
    echo Invalid Directory "%Directory%"
    goto dirchoice
)
if not exist "%Systemdir%\FilePermissionTable" (
    echo File Permission Table not found...
    if not exist "%Systemdir%\SAR" (
        echo Unable to create table...
        echo Reinstall %version%
        pause
        exit
    )
    call "%Systemdir%\FilePermissionTable\GENFILEPERMTABLE.bat"
)
if %directory%==".." goto back
if exist %
(
    set /p requiredtoken=
)>
:eof