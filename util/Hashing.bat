echo %hashing% > Hashing-pt1.txt
CertUtil -hashfile "Hashing-pt1.txt" SHA512 > Hashing-pt2.txt
(
    set /p invalid=
    set /p Hashed=
)<Hashing-pt2.txt
del Hashing-pt1.txt
del Hashing-pt2.txt
:eof
exit /b