setlocal enabledelayedexpansion
set "RemoveDir=%Rootdir:"=SCETQ%"
set "RemoveDir=%RemoveDir:|=SCETP%"
set "RemoveDir=%RemoveDir:&=SCETAN%"
set "RemoveDir=%RemoveDir:@=SCETAT%"
set "RemoveDir=%RemoveDir:\=SCETB%"
set "RemoveDir=%RemoveDir:(=SCETPO%"
set "RemoveDir=%RemoveDir:)=SCETPT%"
set "RemoveDir=%RemoveDir::=SCETCO%"
set "RemoveDir=%RemoveDir:^=SCETCI%"

set "CurrentDirectoryDOSe=%cd:"=SCETQ%"
set "CurrentDirectoryDOSe=%CurrentDirectoryDOSe:|=SCETP%"
set "CurrentDirectoryDOSe=%CurrentDirectoryDOSe:&=SCETAN%"
set "CurrentDirectoryDOSe=%CurrentDirectoryDOSe:@=SCETAT%"
set "CurrentDirectoryDOSe=%CurrentDirectoryDOSe:\=SCETB%"
set "CurrentDirectoryDOSe=%CurrentDirectoryDOSe:(=SCETPO%"
set "CurrentDirectoryDOSe=%CurrentDirectoryDOSe:)=SCETPT%"
set "CurrentDirectoryDOSe=%CurrentDirectoryDOSe::=SCETCO%"

for %%a in ("%RemoveDir%") do set "CollectedDIR=A:!CurrentDirectoryDOSe:%%~a=!"
if "%CollectedDIR%"=="A:" (
    set "CollectedDIR=A:\"
)
setlocal disabledelayedexpansion

set "CollectedDIR=%CollectedDIR:SCETQ=^^^"%"
set "CollectedDIR=%CollectedDIR:SCETP=^^^|%"
set "CollectedDIR=%CollectedDIR:SCETAN=^^^&%"
set "CollectedDIR=%CollectedDIR:SCETAT=^^^@%"
set "CollectedDIR=%CollectedDIR:SCETB=^^^\%"
set "CollectedDIR=%CollectedDIR:SCETPO=^^^(%"
set "CollectedDIR=%CollectedDIR:SCETPT=^^^)%"
set "CollectedDIR=%CollectedDIR:SCETCO=^^^:%"
set "CollectedDIR=%CollectedDIR:SCETCI=^^^^%"



echo %CollectedDIR%>"%Tempdir%\CurrentDirectory.tmp"

set RemoveDir=
set CurrentDirectoryDOSe=
exit /b.