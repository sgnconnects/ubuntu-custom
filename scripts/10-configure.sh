#!/usr/bin/env bash
set -eu

echo "Script: 10-configure.sh"

echo " > Setting the time zone..."
dpkg-reconfigure tzdata
