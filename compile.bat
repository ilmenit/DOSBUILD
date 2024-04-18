@echo off
mkdir logs 2>nul
mkdir output 2>nul
setlocal EnableDelayedExpansion

copy /Y input\AUTOEXEC.OLD input\AUTOEXEC.BAT > nul

echo.
:: Execute NASM and check for errors
nasm\nasm main.asm -fbin -o main.com > logs\nasm_output.txt 2>&1
findstr /c:"error:" logs\nasm_output.txt
if !errorlevel! == 0 (
    rem echo Error detected in NASM output.
) else (
    del logs\nasm_output.txt > nul
    call make-img.bat
)
