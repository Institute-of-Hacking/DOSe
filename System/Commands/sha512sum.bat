set String=%command% sha512sum
set String=%String:~10,-10%

set startdir=%cd%
cd %Tempdir%
CertUtil -hashfile "%String%" SHA512 > Hashing-pt2.txt
(
    set /p invalidA=
    set /p String=
    set /p invalidB=
)<Hashing-pt2.txt
del Hashing-pt2.txt
cd %startdir%
echo %String%
set String=
:eof
exit /b