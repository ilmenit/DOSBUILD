@echo off
mkdir logs >nul
setlocal EnableDelayedExpansion

copy /Y input\AUTOEXEC.OLD input\AUTOEXEC.BAT > nul

:: Execute NASM and check for errors
nasm\nasm main.asm -fbin -o main.com > logs\nasm_output.txt 2>&1
findstr /c:"error:" logs\nasm_output.txt
if !errorlevel! == 0 (
    rem echo Error detected in NASM output.
) else (
    del nasm_output.txt
    call make-img.bat
)
