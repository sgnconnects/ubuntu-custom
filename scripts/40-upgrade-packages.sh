#!/usr/bin/env bash
set -eu

echo "Script: 40-upgrade-packages.sh"

echo " > Upgrade the system..."
apt-get -y full-upgrade
