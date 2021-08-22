for %%I in (.) do set CurrDirName=%%~nxI
set hour=%time:~0,2%
if "%hour:~0,1%" == " " set hour=0%hour:~1,1%
echo hour=%hour%
set min=%time:~3,2%
if "%min:~0,1%" == " " set min=0%min:~1,1%
echo min=%min%
set secs=%time:~6,2%
if "%secs:~0,1%" == " " set secs=0%secs:~1,1%
echo secs=%secs%

set year=%date:~-4%
echo year=%year%

set month=%date:~4,2%
if "%month:~0,1%" == " " set month=0%month:~1,1%
echo month=%month%
set day=%date:~4,2%
if "%day:~0,1%" == " " set day=0%day:~1,1%
echo day=%day%

set datetimef=%month%%day%%year%_%hour%%min%%secs%
set vBatPath="C:\Users\Krabs\Downloads\Development\GitHub_Repositories"

xcopy /Y /s %CurrDirName%\ "%vBatPath%\%CurrDirName%\"


echo set WshShell = WScript.CreateObject("WScript.Shell") > %tmp%\tmp.vbs
echo WScript.Quit (WshShell.Popup( "Copied %CurrDirName% to local GitHub Repo!" ,2 ,"Windows Code Deploy", 0 + 64)) >> %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
del %tmp%\tmp.vbs
