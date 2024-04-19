# DOSBUILD environment

The DOSBUILD environment is a time-saver for writing a code in NASM for FreeDOS.
It allows *one-click compilation* and debugging, or even *no-click compilation* (with a watcher over file changes).
It's integrated with the VirtualBox so a correctly compiled *main.asm* file get automatically executed in a FreeDOS VM.

![screenshot](https://raw.githubusercontent.com/ilmenit/DOSBUILD//master/dosbuild.png)

## Setup

Clone or Download the whole GitHub repo (Code -> Download ZIP).

Build environment must be in C:\DOSBUILD (so you will have folders like C:\DOSBUILD\input).

To automate the workflow with VirtualBox you need to add a command line support to it.

Install *VirtualBox 7.0* (if you don't have it yet):

1. Download VirtualBox *for Windows* from https://www.virtualbox.org/wiki/Downloads . No other platforms are supported yet.
2. Install VirtualBox into default path (C:\Program Files\Oracle\VirtualBox)

## One-time compilation

Start *compile.bat* to compile *main.asm*

This will compile main.asm file and then will launch make-img.bat that will create a floppy image and will launch VirtualBox.

## Watch mode

Start *watch.bat* to watch changes of *main.asm*

Watch mode will observe modification of the main.asm file and whenever the file is modified using an external editor, it will launch compile.bat

## Debugging 

Start *debug.bat* to debug *main.com* compiled from *main.asm*

By default Turbo Debugger TD.EXE is used as a debugger.
Add your own debugger into C:\DOSBUILD\input and set it in C:\DOSBUILD\input\DEBUG.BAT  

In "input" folder you can modify the AUTOEXEC.BAT and add more files to .
