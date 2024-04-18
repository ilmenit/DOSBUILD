@echo off
"C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" storageattach "DOSIMG" --storagectl "Floppy" --device 0 --type fdd --medium C:/DOSBUILD/output/main.img 2> logs\insertfloppy.log