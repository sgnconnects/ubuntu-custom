#!/usr/bin/env bash
set -eu

# Remove unused packages
apt-get -y purge rhythmbox*
apt-get -y purge thunderbird*

# FIX: the bug in application Totem "The specified movie could not be found."
apt-get -y purge gstreamer1.0-vaapi

# Remove others packages
apt-get -y --purge autoremove
