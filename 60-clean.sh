#!/usr/bin/env bash
set -eu

# Clean apt cache
apt -y clean

# Remove residual configs
dpkg -l | grep '^rc' | awk '{print $2}' | xargs apt-get -y purge

# Remove others packages
apt -y --purge autoremove
