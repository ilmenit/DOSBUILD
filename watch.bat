@echo off
echo First start
mkdir logs >nul

setlocal EnableDelayedExpansion

:: Initialize prev_mod_time with a dummy value to ensure it's not empty
set "prev_mod_time=dummy"

:watch
:: Get the last modification time of main.asm with seconds precision
for /f "tokens=2 delims==" %%I in ('wmic DataFile where "Name='C:\\DOSBUILD\\main.asm'" get LastModified /VALUE') do (
    set "mod_time=%%I"
    set "mod_time=!mod_time:~0,4!-!mod_time:~4,2!-!mod_time:~6,2! !mod_time:~8,2!:!mod_time:~10,2!:!mod_time:~12,2!"
    rem echo Current mod_time: !mod_time!
    rem echo Previous mod_time: !prev_mod_time!
    
    if not "!mod_time!"=="!prev_mod_time!" (
        set "prev_mod_time=!mod_time!"
        rem echo Change detected, running compile.bat...
        
        :: Call compile.bat to execute NASM and check for errors
        call compile.bat
        echo Watching for changes in main.asm		
    ) else (
        rem echo No change detected.
    )
)

:: Wait for 1 second
timeout /t 1 >nul

goto watch
