#!/usr/bin/env bash
set -eu

# Clean apt cache
apt-get -y clean

# Remove residual configs
dpkg -l | grep '^rc' | awk '{print $2}' | xargs apt-get -y purge

# Remove others packages
apt-get -y --purge autoremove
