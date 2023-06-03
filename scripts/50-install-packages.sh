#!/usr/bin/env bash
set -eu

echo "Script: 50-install-packages.sh"

echo " > Installing packages..."

_install_apt() {
    local PACKAGE=$1

    if ! dpkg -s "$PACKAGE" &>/dev/null; then
        apt-get -y install "$PACKAGE"
    fi
}

# System
_install_apt exfat-fuse
_install_apt p7zip-full

# System: install grub package (to work in offline)
_install_apt grub-efi-amd64-bin

# GNOME Apps
_install_apt audacious
_install_apt brasero
_install_apt cdrdao
_install_apt dvdauthor
_install_apt gnome-calculator
_install_apt gnome-characters
_install_apt gnome-system-monitor
_install_apt transmission-gtk
_install_apt xournal

# Multimedia
_install_apt vlc

# Graphics
_install_apt gimp
_install_apt gimp-plugin-registry
_install_apt inkscape

# Others
_install_apt gstreamer1.0-plugins-bad
_install_apt ubuntu-restricted-extras

# Language
_install_apt aspell-en
_install_apt aspell-pt-br
_install_apt hunspell-en-us
_install_apt hunspell-pt-br
_install_apt hyphen-en-us
_install_apt hyphen-pt-br
