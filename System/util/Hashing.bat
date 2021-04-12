set startdir=%cd%
cd %Tempdir%
echo %hashing% > Hashing-pt1.txt
CertUtil -hashfile "Hashing-pt1.txt" SHA512 > Hashing-pt2.txt
(
    set /p invalidA=
    set /p Hashed=
    set /p invalidB=
)<Hashing-pt2.txt
set LoginSectionC=p%version%%invalidA%%Hashed%%invalidB%%user%
del Hashing-pt1.txt
del Hashing-pt2.txt
(
    echo %invalidA%
    echo %Hashed%
    echo %invalidB%
)>LoginLog.txt
cd %startdir%
:eof
exit /b