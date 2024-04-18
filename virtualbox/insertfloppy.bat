@echo off
SET VBoxManagePath=%ProgramFiles%\Oracle\VirtualBox\VBoxManage.exe

IF EXIST "%VBoxManagePath%" (
    "%VBoxManagePath%" storageattach "DOSIMG" --storagectl "Floppy" --device 0 --type fdd --medium C:/DOSBUILD/output/main.img 2> logs\insertfloppy.log
) ELSE (
    echo VBoxManage.exe not found.
)
