#!/usr/bin/env bash
set -eu

_remove_package() {
    local PACKAGE="$1"

    if dpkg -s "$PACKAGE" &>/dev/null; then
        apt-get -y purge "$PACKAGE"*
    fi
}

# Remove unused packages
_remove_package firefox
_remove_package rhythmbox
_remove_package thunderbird

# FIX: the bug in application Totem "The specified movie could not be found."
_remove_package gstreamer1.0-vaapi

# FIX: problem with Canon Scanner in Ubuntu 20.04
_remove_package ippusbxd

# Remove others packages
apt-get -y --purge autoremove
