@echo off	
set pass=0
set filename=BatchOS.bat
if not exist "BatchOS.bat" (
goto relocatecheck
) else goto file1exist
:file1exist
setlocal enabledelayedexpansion
set /a count=1
for /f "skip=1 delims=:" %%B in ('CertUtil -hashfile "%filename%" SHA512') do (
if !count! equ 1 set "SHA512=%%B"
set/a count+=1
)
set "SHA512=%SHA512: =%
	echo SHA512 hash of %filename% is: %SHA512%
set /a count=1
for /f "skip=1 delims=:" %%B in ('CertUtil -hashfile "%filename%" SHA384') do (
if !count! equ 1 set "SHA384=%%B"
set/a count+=1
)
set "SHA384=%SHA384: =%
	echo SHA384 hash of %filename% is: %SHA384%
set /a count=1
for /f "skip=1 delims=:" %%B in ('CertUtil -hashfile "%filename%" SHA256') do (
if !count! equ 1 set "SHA256=%%B"
set/a count+=1
)
set "SHA256=%SHA256: =%
	echo SHA256 hash of %filename% is: %SHA256%
set /a count=1
for /f "skip=1 delims=:" %%B in ('CertUtil -hashfile "%filename%" SHA1') do (
if !count! equ 1 set "SHA1=%%B"
set/a count+=1
)
set "SHA1=%SHA1: =%
	echo SHA1   hash of %filename% is: %SHA1%
set /a count=1
for /f "skip=1 delims=:" %%B in ('CertUtil -hashfile "%filename%" md5') do (
if !count! equ 1 set "md5=%%B"
set/a count+=1
)
set "md5=%md5: =%
	echo MD5    hash of %filename% is: %md5%
set /a count=1
for /f "skip=1 delims=:" %%B in ('CertUtil -hashfile "%filename%" md4') do (
if !count! equ 1 set "md4=%%B"
set/a count+=1
)
set "md4=%md4: =%
	echo MD4    hash of %filename% is: %md4%
set /a count=1
for /f "skip=1 delims=:" %%B in ('CertUtil -hashfile "%filename%" md2') do (
if !count! equ 1 set "md2=%%B"
set/a count+=1
)
set "md2=%md2: =%
	echo MD2    hash of %filename% is: %md2%
if '%SHA512%'=='26b8113943a9a013361df024423e57e28d622cbdbe548fde76e3c56cb6c879da78f1c96eb7b36be9563cc89463952d862fa1e30b8c0ec25d1004b83d254f99b9' goto f1hSHA512-p
:f1hSHA512-f
set pass = 0
echo SHA512 is invalid reinstall batchos if the issue persists open a report on the github page
goto hashfail
goto hvf
:f1hSHA512-p
echo SHA512 is valid


if '%SHA384%'=='22810ccb061fcbcad8d806317fc3401fd3874752e3cab49f7364ad524519b90a81a8f63b092787b0513906ba7b2c3f26' goto f1hSHA384-p
:f1hSHA384-f
set pass = 0
echo SHA384 is invalid reinstall batchos if the issue persists open a report on the github page
goto hashfail
goto hvf
:f1hSHA384-p
echo SHA384 is valid


if '%SHA256%'=='eedba319e407b6076c1f89e9414e11c753f1ddf03ce796496d8e01eeac5f4416' goto f1hSHA256-p
:f1hSHA256-f
set pass = 0
echo SHA256 is invalid reinstall batchos if the issue persists open a report on the github page
goto hashfail
goto hvf
:f1hSHA256-p
echo SHA256 is valid


if '%SHA1%'=='271feed89a0ce3d65f3c066009ce495c1f0a1037' goto f1hSHA1-p
:f1hSHA1-f
set pass = 0
echo SHA1 is invalid reinstall batchos if the issue persists open a report on the github page
goto hashfail
goto hvf
:f1hSHA1-p
echo SHA1 is valid


if '%MD5%'=='c5dd69a38fa2a73ba7457dee16821cbe' goto f1hMD5-p
:f1hMD5-f
set pass = 0
echo MD5 is invalid reinstall batchos if the issue persists open a report on the github page
goto hashfail
goto hvf
:f1hMD5-p
echo MD5 is valid


if '%MD4%'=='7a731086800098b70a4758bce5fb8fb3' goto f1hMD4-p
:f1hMD4-f
set pass = 0
echo MD4 is invalid reinstall batchos if the issue persists open a report on the github page
goto hashfail
goto hvf
:f1hMD4-p
echo MD4 is valid


if '%MD2%'=='bd3490dd77b21ce8874286057a23e41e' goto f1hMD2-p
:f1hMD2-f
set pass = 0
echo MD2 is invalid reinstall batchos if the issue persists open a report on the github page
goto hashfail
goto hvf
:f1hMD2-p
echo MD2 is valid
:f1h2

pause
