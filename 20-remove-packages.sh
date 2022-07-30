#!/usr/bin/env bash
set -eu

# Remove unused packages
apt-get -y purge firefox*
apt-get -y purge rhythmbox*
apt-get -y purge thunderbird*

# Workaround to fix the problem with Canon Scanner
#apt-get -y purge ippusbxd # Removed for 22.04

# Remove others packages
apt-get -y --purge autoremove
