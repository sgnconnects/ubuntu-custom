#!/usr/bin/env bash
set -eu

# System
apt -y install p7zip-full
apt -y install exfat-fuse

# GNOME Apps
#apt -y install kazam
apt -y install audacious
apt -y install brasero cdrdao dvdauthor
apt -y install gnome-calculator
apt -y install gnome-characters
apt -y install gnome-system-monitor
apt -y install transmission-gtk
apt -y install xournal

# Others
apt -y install ubuntu-restricted-extras
apt -y install gstreamer1.0-plugins-bad

# Language
apt -y install aspell-en aspell-pt-br
apt -y install hunspell-en-us hunspell-pt-br
apt -y install hyphen-en-us hyphen-pt-br

# My workstation only

# System
apt -y install curl syslinux extlinux wimtools # For bootiso

# GNOME Apps
apt -y install audacity
apt -y install gparted
apt -y install meld
apt -y install synaptic

# Graphics
apt -y install gimp gimp-plugin-registry
apt -y install inkscape

# Utilities
apt -y install aria2
apt -y install hexedit
apt -y install jpegoptim
apt -y install lm-sensors
apt -y install parallel
apt -y install pdfgrep
apt -y install qpdf
apt -y install rdfind
apt -y install tmux

# Forensic
apt -y install secure-delete
apt -y install testdisk

# Network
apt -y install openssh-server

# Multimedia
apt -y install ffmpeg
apt -y install lame
apt -y install mediainfo
apt -y install mp3val

# Development
apt -y install build-essential
apt -y install clang-format
apt -y install cmake
apt -y install devscripts debhelper cdbs
apt -y install git

# Dev libraries
apt -y install libwxgtk3.0-gtk3-dev libwxgtk-media3.0-gtk3-dev
apt -y install freeglut3-dev libsdl2-mixer-dev libsoil-dev libgtk-3-dev
#apt -y install python3-pip python3-venv

# Network
apt -y install nmap

# Latex
apt -y install texlive texlive-latex-extra texlive-science texlive-publishers texlive-lang-portuguese texlive-xetex texlive-extra-utils texlive-fonts-extra latexmk latexdiff
apt -y install pandoc

# VPN
apt -y install network-manager-fortisslvpn-gnome

# External
apt -y install google-chrome-stable
