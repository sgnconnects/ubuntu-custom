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

# My workstation only

# System (For bootiso)
_install_apt curl
_install_apt extlinux
_install_apt syslinux
_install_apt wimtools

# GNOME Apps
_install_apt audacity
_install_apt gparted
_install_apt meld
_install_apt synaptic

# Graphics
_install_apt gimp
_install_apt gimp-plugin-registry
_install_apt inkscape

# Utilities
_install_apt aria2
_install_apt evtest
_install_apt findimagedupes
_install_apt hexedit
_install_apt jpegoptim
_install_apt lm-sensors
_install_apt optipng
_install_apt parallel
_install_apt pdfgrep
_install_apt qpdf
_install_apt rdfind
_install_apt tmux

# Forensic
_install_apt foremost
_install_apt secure-delete
_install_apt testdisk

# Network
_install_apt openssh-server

# Multimedia
_install_apt ffmpeg
_install_apt lame
_install_apt mediainfo
_install_apt mp3val

# Development
_install_apt build-essential
_install_apt cdbs
_install_apt clang-format
_install_apt cmake
_install_apt debhelper
_install_apt devscripts
_install_apt git

# Dev libraries
_install_apt freeglut3-dev
_install_apt libgtk-3-dev
_install_apt libsdl2-mixer-dev
_install_apt libsoil-dev
_install_apt libwxgtk-media3.0-gtk3-dev
_install_apt libwxgtk3.0-gtk3-dev
#_install_apt python3-pip
#_install_apt python3-venv

# Network
_install_apt nmap

# Latex
_install_apt pandoc
_install_apt texlive
_install_apt texlive-extra-utils
_install_apt texlive-fonts-extra
_install_apt texlive-lang-portuguese
_install_apt texlive-latex-extra
_install_apt texlive-publishers
_install_apt texlive-science
_install_apt texlive-xetex
_install_apt latexdiff
_install_apt latexmk

# VPN
_install_apt network-manager-fortisslvpn-gnome

# External
_install_apt google-chrome-stable
