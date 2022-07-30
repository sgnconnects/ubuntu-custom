#!/usr/bin/env bash

# Build my personal Ubuntu distro with Cubic
#
# Author: Cristiano Nunes <cfgnunes@gmail.com>

set -eu

SCRIPT_NAME=$(basename "$0")

# shellcheck disable=SC1091
_main() {
    _log "Setting the keyboard layout..."
    dpkg-reconfigure keyboard-configuration

    _log "Setting the time zone..."
    dpkg-reconfigure tzdata

    _log "Removing apt lists..."
    rm -rf /var/lib/apt/lists/*ubuntu_dists*

    _log "Creating new 'sources.list'..."
    cat >"/etc/apt/sources.list" <<EOF
deb http://br.archive.ubuntu.com/ubuntu/ jammy main multiverse universe restricted
deb http://br.archive.ubuntu.com/ubuntu/ jammy-updates main multiverse universe restricted
deb http://br.archive.ubuntu.com/ubuntu/ jammy-backports main multiverse universe restricted
deb http://security.ubuntu.com/ubuntu jammy-security main multiverse universe restricted
EOF

    _log "Updating packages list..."
    apt update

    _log "Running main scripts..."
    source 20-remove-packages.sh
    source 30-repositories.sh
    source 40-update-packages.sh
    source 50-install-packages.sh
    source 60-clean.sh
    source 70-optimizations.sh

    # Install grub package (to work in offline)
    _log "Installing grub package..."
    apt -y install grub-efi-amd64-bin

    _log "Setting a 'gnome-mimeapps.list' file..."
    cp gnome-mimeapps.list /usr/share/applications/
    chmod 644 /usr/share/applications/gnome-mimeapps.list
    chown root:root /usr/share/applications/gnome-mimeapps.list

    _log "Removing logs..."
    find /var/log/* -type f -iname "*log" -exec truncate -s 0 {} \;
    find /var/log/* -type f -iname "dmesg" -exec truncate -s 0 {} \;
    find /var/log/* -type f -iname "*\.[0-99]" -delete
    find /var/log/* -type f -iname "*\.gz*" -delete
    find /var/log/* -type f -iname "*\.xz*" -delete
    find /var/log/* -type f -iname "*old" -delete

    # Clean 'root' user transient files
    rm -rf /root/.cache
    rm -rf /root/.local
    rm -rf /root/.wget-hsts
    rm -rf /root/snap
    history -c && history -w && rm -rf /root/.bash_history

    _log "Done!"
}

_log() {
    STR_MESSAGE=$1

    #logger -s "[$SCRIPT_NAME] $STR_MESSAGE"
    echo "[$SCRIPT_NAME] $STR_MESSAGE"
}

_main "$@"
