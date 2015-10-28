@echo on
rem    Rebuild the kolab client

del progress.txt
call :rebuild kdelibs
call :rebuild akonadi
call :rebuild kdepimlibs
call :rebuild baloo
call :rebuild kdepim-runtime
call :rebuild kdepim
call :rebuild zanshin
call emerge --package kdepim-e5-package
echo Build complete: %time% >> progress.txt

:rebuild
echo Start %~1: %time% >> progress.txt
call emerge --cleanbuild "%~1" --fetch "%~1" --compile "%~1" --install "%~1"
echo End %~1: %time% >> progress.txt
goto:eof
