#!/usr/bin/env bash
set -eu

echo "Script: 10-configure.sh"

echo " > Region and language: time zone..."
dpkg-reconfigure tzdata
