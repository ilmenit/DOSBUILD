@echo off
SET VBoxManagePath=%ProgramFiles%\Oracle\VirtualBox\VBoxManage.exe

IF EXIST "%VBoxManagePath%" (
    "%VBoxManagePath%" controlvm "DOSIMG" reset 2> logs\restartvm.log
) ELSE (
    echo VBoxManage.exe not found.
)
