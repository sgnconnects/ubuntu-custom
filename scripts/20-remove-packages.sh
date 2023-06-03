#!/usr/bin/env bash
set -eu

echo "Script: 20-remove-packages.sh"

echo " > Remove unused packages..."
apt-get -y purge firefox
apt-get -y purge rhythmbox
apt-get -y purge thunderbird
apt-get -y purge totem

echo " > Remove others packages..."
apt-get -y --purge autoremove
