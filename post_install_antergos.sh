#!/bin/bash

# Set commands
inst='pacman --needed --noconfirm -S'
aurinst='aurman --needed --noconfirm -S'

echo "Official packages"
sudo pacman -Syyu

sudo pacman $inst git
sudo pacman $inst rsync texlive-most lyx keepassxc 


# Install aurman
echo "aurman"

# Import pgp key
gpg --recv-keys 465022E743D71E39
git clone https://aur.archlinux.org/aurman-git.git
cd aurman-git/
makepkg -si --needed --noconfirm
cd ..
rm -rf aurman-git/

# Show message confirmation window
aurman -Syyu

# AUR packages

$aurinst jetbrains-toolbox
$aurinst sublime-text-dev
$aurinst youtube-dl
$aurinst pycharm

echo "Installing GNOME extensions"
# Install extensions
$aurinst gnome-shell-extension-no-title-bar-git gnome-shell-extension-audio-output-switcher-git gnome-shell-extension-topicons-plus-git gnome-shell-extension-workspace-grid-git
