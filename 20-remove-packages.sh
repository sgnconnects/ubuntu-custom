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

# Remove others packages
apt-get -y --purge autoremove
