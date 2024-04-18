@echo off
"C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" storageattach "DOSIMG" --storagectl "Floppy" --device 0 --type fdd --medium emptydrive 2> logs\removefloppy.log