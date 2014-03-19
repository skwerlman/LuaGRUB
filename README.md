LuaGRUB
=======
A GRUB-like bootloader for ComputerCraft

Features:
- Select between multiple OSes on a single computer.
- OSes can reboot into another OS (even CraftOS), if they support it.
- Use no global variables.
- Automated installer
- Automated self-updater

Planned:
- Lie to OSes so they think they are in the root folder, so OSes with absolute paths will not require recoding. (Coming in v2.0)
- Support scrolling. (Maybe...)
- Support persistent OS selections. (A new OS can already be chosen, but currently the OS must not reboot for the decision to have any effect.)
- Support for non-color and non-http computers
