@echo off
SET VBoxManagePath=%ProgramFiles%\Oracle\VirtualBox\VBoxManage.exe

IF EXIST "%VBoxManagePath%" (
    "%VBoxManagePath%" controlvm "DOSIMG" poweroff --type headless
) ELSE (
    echo VBoxManage.exe not found.
)
