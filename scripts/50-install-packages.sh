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
_install_apt unrar

# GNOME Apps
_install_apt brasero
_install_apt cdrdao
_install_apt dvdauthor
_install_apt xournal

# Graphics
_install_apt gimp
_install_apt gimp-plugin-registry
_install_apt inkscape

# Multimedia
_install_apt audacious
_install_apt vlc

# Codecs
_install_apt gstreamer1.0-plugins-bad
_install_apt libavcodec-extra
_install_apt ubuntu-restricted-addons

# Language
_install_apt hunspell-en-us
_install_apt hunspell-pt-br
_install_apt hyphen-en-us
_install_apt hyphen-pt-br
_install_apt wamerican
_install_apt wbrazilian
_install_apt wbritish
