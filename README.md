LuaGRUB
=======
A GRUB-like bootloader for ComputerCraft

Features:
- Select between multiple OSes on a single computer.
- OSes can reboot into another OS, if they support it.
- Uses no global variables.

Planned:
- Trick OSes into thinking they are in the root folder, so OSes with absolute paths will not require recoding.
- Support scrolling.
- Support persistent OS selections. (A new OS can already be chosen, but currently the OS must not reboot for the decision to have any effect.)
