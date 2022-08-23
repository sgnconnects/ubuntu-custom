#!/usr/bin/env bash
set -eu

_remove_package() {
    local PACKAGE="$1"

    if dpkg -s "$PACKAGE" &>/dev/null; then
        apt-get -y purge "$PACKAGE"*
    fi
}

# Adjust swappiness: uses 90% of RAM before Linux kernel begins swapping
echo "vm.swappiness=10" >> /etc/sysctl.conf

# Adjust for VSCode and Insync
echo "fs.inotify.max_user_watches=1048576" >> /etc/sysctl.conf

# Disable apport
sed -i "s|enabled=1|enabled=0|" /etc/default/apport

# FIX: shutdown timeout
sed -i "s|#DefaultTimeoutStopSec=90s|DefaultTimeoutStopSec=10s|" /etc/systemd/system.conf

# FIX: write permission with PDF in ImageMagick
sed -i 's/rights="none" pattern="PDF"/rights="read|write" pattern="PDF"/' /etc/ImageMagick-6/policy.xml

# FIX: the bug in application Totem "The specified movie could not be found."
_remove_package gstreamer1.0-vaapi

# FIX: problem with Canon Scanner in Ubuntu 20.04
_remove_package ippusbxd
