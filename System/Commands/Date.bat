for /f "tokens=2" %%A in ('date /t') do set date=%%A
echo %date%
set date=
exit /b