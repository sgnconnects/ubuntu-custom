#!/usr/bin/env bash
set -eu

echo "Script: 10-configure.sh"

echo " > Setting the keyboard layout..."
dpkg-reconfigure keyboard-configuration

echo " > Setting the time zone..."
dpkg-reconfigure tzdata
