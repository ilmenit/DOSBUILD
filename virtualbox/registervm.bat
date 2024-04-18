@echo off
SET VBoxManagePath=%ProgramFiles%\Oracle\VirtualBox\VBoxManage.exe

IF EXIST "%VBoxManagePath%" (
    "%VBoxManagePath%" registervm C:\DOSBUILD\virtualbox\DOSIMG\DOSIMG.vbox 2> logs\registervm.log
) ELSE (
    echo VBoxManage.exe not found.
)
