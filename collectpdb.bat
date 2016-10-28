@echo on
rem    Collect all pdb files

set dTarget=C:\Users\kolab\kdepimwindows\tmp\pdb\
mkdir "%dTarget%\"
set fType=*.pdb

call :gatherFiles "%fType%" "C:\Users\kolab\kdepimwindows\build\kde\kdepimlibs-20110129\image-msvc2013-RelWithDebInfo-gitHEAD\" "%dTarget%\"
call :gatherFiles "%fType%" "C:\Users\kolab\kdepimwindows\build\kde\kdepim-runtime-20101222\image-msvc2013-RelWithDebInfo-gitHEAD\" "%dTarget%\"
call :gatherFiles "%fType%" "C:\Users\kolab\kdepimwindows\build\kde\kdepim-20080202\work\msvc2013-RelWithDebInfo-gitHEAD\" "%dTarget%\"

:gatherFiles
for /f "delims=" %%f in ('dir /a-d /b /s "%~2\%~1"') do (
    copy /V "%%f" "%~3\" 2>nul
)
goto:eof

