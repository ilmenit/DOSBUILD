@echo off
echo Making a new floppy image

setlocal EnableDelayedExpansion

echo - registering VM (if not registered)

:: Register VM if not registered
call virtualbox\registervm.bat

echo - shutting down VM

del logs\checkvmrunning.log > nul

:: Shut down the VM to unlock main.img
call virtualbox\shutdownvm.bat

call virtualbox\checkvmrunning.bat

:terminate
findstr /c:"running (" logs\checkvmrunning.log
if !errorlevel! == 0 (
	echo Machine not terminated, trying again...
    timeout /t 1
	call virtualbox\shutdownvm.bat
    timeout /t 1
	call virtualbox\checkvmrunning.bat
    goto terminate
)

del logs\checkvmrunning.log > nul

:: Replace main.com in the input folder with the one that was just created
copy /Y main.com input\main.com >nul 

:: Check if main.img file in the output folder is locked
if exist output\main.img (
    2>nul (
        >>output\main.img echo off
    ) && (
        del /Q output\main.img
    ) || (
        echo The file output\main.img is locked and cannot be deleted.
        exit /b 1
    )
)

echo - building a new .img

:: Use bfi to create a new main.img file
bfi\bfi.exe -f=output\main.img -b=freedos\freedos.boot.sector.1.4MB.img input

:: Check for errors after bfi command
if not errorlevel 0 (
    echo Error creating main.img.
    exit /b 1
)

:: Get the full path of the newly created main.img
for %%I in ("output\main.img") do set "fullpath=%%~fI"

echo - img created successfully
echo %fullpath%

echo - starting VM

call virtualbox\startvm.bat

:: Start the VM after the img is created successfully
call virtualbox\checkvmrunning.bat

:launch
findstr /c:"running (" logs\checkvmrunning.log
if !errorlevel! neq 0 (
	echo Machine not launched, trying again...
    timeout /t 1
	call virtualbox\startvm.bat
    timeout /t 1
	call virtualbox\checkvmrunning.bat
    goto launch
)

