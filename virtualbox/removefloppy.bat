@echo off
SET VBoxManagePath=%ProgramFiles%\Oracle\VirtualBox\VBoxManage.exe

IF EXIST "%VBoxManagePath%" (
    "%VBoxManagePath%" storageattach "DOSIMG" --storagectl "Floppy" --device 0 --type fdd --medium emptydrive 2> logs\removefloppy.log
) ELSE (
    echo VBoxManage.exe not found.
)
