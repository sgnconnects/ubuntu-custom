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
    source scripts/51-install-packages-dev.sh
    source scripts/55-install-packages-external.sh
    source scripts/56-install-packages-external-dev.sh
    source scripts/60-optimizations.sh
    source scripts/80-desktop-settings.sh
    source scripts/90-clean.sh

    echo "Done!"
}

_main "$@"
