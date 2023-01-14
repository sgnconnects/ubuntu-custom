#!/usr/bin/env bash
set -eu

echo "Setting the keyboard layout..."
dpkg-reconfigure keyboard-configuration

echo "Setting the time zone..."
dpkg-reconfigure tzdata
