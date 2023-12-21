README
======

This file contains the following sections:
PACKAGE INSTALLATION
COMMON DIRECTORIES

NOTE that this file is under-construction and isn't meant to be complete. But it
serves as a good reminder to install the required things on the right time.

PACKAGE INSTALLATION
====================

Must haves. Change intel drivers with your own
> pacman -S xorg xorg-server git base-devel networkmanager
> pacman -S xclip xf86-video-intel

Desktop environment
-------------------
> pacman -S i3-wm lightdm lightdm-gtk-greeter nitrogen
> systemctl enable lightdm

Development utilites
--------------------
> pacman -S qt6ct lxappearance
> pacman -S flameshot
> pacman -S clang
> pacman -S unzip
> pacman -S neovim

Brightness setup in i3
----------------------
> yay -S acpilight ## install yay-git from AUR
> chmod a+rw /sys/class/backlight/intel_backlight/brightness ## to fix the permission issues

Filesystem Management
---------------------
Currently, I am using the terminal to navigate everywhere and it pretty much does the job properly. If there would be any requirement, this section will change. For the same reason, I have not installed any utilities like thunar or pcmanfm with file-roller ark and whatnot. Try to use the less things to unclutter the desktop. Most probably you don't need all those fancy gui tools. My personal recommendation for those you still want to install ranger -> first check out neovim netrw. I use it for the programming and it works like a charm and it can even select and move files and pretty much do anything expected. For images and videos, you might want to look more on the things -- as I don't have much utility for those -- browser works fine if I want to look at an image.

COMMON DIRECTORIES
==================
> mkdir -p ~/Applications ~/Desktop ~/Downloads ~/Movies ~/Music ~/Pictures
> mkdir -p ~/.config ~/.local ~/.local/share/fonts

