#!/usr/bin/env bash
set -eu

echo "Remove unused packages..."
apt-get -y purge firefox
apt-get -y purge rhythmbox
apt-get -y purge thunderbird

echo "Remove others packages..."
apt-get -y --purge autoremove
