#!/usr/bin/env bash
set -eu

echo "Script: 51-install-packages-dev.sh"

echo " > Installing packages..."

_install_apt() {
    local PACKAGE=$1

    if ! dpkg -s "$PACKAGE" &>/dev/null; then
        apt-get -y install "$PACKAGE"
    fi
}

# System (For woeusb)
_install_apt wimtools

# GNOME Apps
_install_apt audacity
_install_apt gparted
_install_apt meld
_install_apt synaptic

# Utilities
_install_apt aptitude
_install_apt aria2
_install_apt evtest
_install_apt findimagedupes
_install_apt hexedit
_install_apt htop
_install_apt jpegoptim
_install_apt lm-sensors
_install_apt optipng
_install_apt parallel
_install_apt pdfgrep
_install_apt qpdf
_install_apt rdfind
_install_apt silversearcher-ag
_install_apt stress
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
