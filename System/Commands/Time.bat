for /f "tokens=1" %%A in ('time /t') do set timeA=%%A
for /f "tokens=2" %%B in ('time /t') do set timeB=%%B
set time=%timeA% %timeB%
echo %time%
exit /b