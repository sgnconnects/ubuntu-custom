#!/usr/bin/env bash

# Build my personal Ubuntu distro with Cubic
#
# Author: Cristiano Fraga G. Nunes <cfgnunes@gmail.com>

set -eu

# shellcheck disable=SC1091
_main() {
    echo "Running main scripts..."
    source scripts/10-configure.sh
    source scripts/20-remove-packages.sh
    source scripts/30-add-repositories.sh
    source scripts/40-upgrade-packages.sh
    source scripts/50-install-packages.sh
    source scripts/60-optimizations.sh

    echo " > Setting a 'gnome-mimeapps.list' file..."
    cp data/gnome-mimeapps.list /usr/share/applications/
    chmod 644 /usr/share/applications/gnome-mimeapps.list
    chown root:root /usr/share/applications/gnome-mimeapps.list

    source scripts/70-clean.sh

    echo "Done!"
}

_main "$@"
