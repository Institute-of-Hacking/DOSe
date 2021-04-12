set "String=%command:SCETP=^^^^^^^|%"
set "String=%String:SCETQ=^^^^^^^"%"
set "String=%String:SCETAN=^^^^^^^&%"
set "String=%String:SCETAT=^^^^^^^@%"
set "String=%String:SCETB=^^^^^^^\%"
set "String=%String:SCETPO=^^^^^^^(%"
set "String=%String:SCETPT=^^^^^^^)%"
set "String=%String:SCETCO=^^^^^^^:%"
set "String=%String:SCETCI=^^^^^^^^%"

set String=%String% ohce
set String=%String:~5,-5%

echo %String%
rem AHH
set String=