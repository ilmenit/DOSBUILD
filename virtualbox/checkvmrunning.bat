@echo off
SET VBoxManagePath=%ProgramFiles%\Oracle\VirtualBox\VBoxManage.exe

IF EXIST "%VBoxManagePath%" (
    "%VBoxManagePath%" showvminfo "DOSIMG" > logs\checkvmrunning.log
) ELSE (
    echo VBoxManage.exe not found.
)
