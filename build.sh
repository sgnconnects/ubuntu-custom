#!/usr/bin/env bash

# Build my personal Ubuntu distro with Cubic
#
# Author: Cristiano Fraga G. Nunes <cfgnunes@gmail.com>

set -eu

SCRIPT_NAME=$(basename "$0")

# shellcheck disable=SC1091
_main() {
    _log "Setting the keyboard layout..."
    dpkg-reconfigure keyboard-configuration

    _log "Setting the time zone..."
    dpkg-reconfigure tzdata

    _log "Running main scripts..."
    source scripts/20-remove-packages.sh
    source scripts/30-add-repositories.sh
    source scripts/40-update-packages.sh
    source scripts/50-install-packages.sh
    source scripts/60-optimizations.sh

    _log "Setting a 'gnome-mimeapps.list' file..."
    cp data/gnome-mimeapps.list /usr/share/applications/
    chmod 644 /usr/share/applications/gnome-mimeapps.list
    chown root:root /usr/share/applications/gnome-mimeapps.list

    source scripts/70-clean.sh

    _log "Done!"
}

_log() {
    local MESSAGE=$1

    #logger -s "[$SCRIPT_NAME] $MESSAGE"
    echo "[$SCRIPT_NAME] $MESSAGE"
}

_main "$@"
