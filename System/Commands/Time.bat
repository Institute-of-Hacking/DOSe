for /f "tokens=1,2" %%B in ('time /t') do set time=%%B
echo %time%
set time=
exit /b