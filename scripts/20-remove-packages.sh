#!/usr/bin/env bash
set -eu

# Remove unused packages
apt-get -y purge firefox
apt-get -y purge rhythmbox
apt-get -y purge thunderbird

# Remove others packages
apt-get -y --purge autoremove
