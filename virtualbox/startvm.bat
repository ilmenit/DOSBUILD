@echo off
SET VBoxManagePath=%ProgramFiles%\Oracle\VirtualBox\VBoxManage.exe

IF EXIST "%VBoxManagePath%" (
    "%VBoxManagePath%" startvm "DOSIMG" 2> logs\startvm.log
) ELSE (
    echo VBoxManage.exe not found.
)
