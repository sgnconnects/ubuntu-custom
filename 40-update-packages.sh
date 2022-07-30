#!/usr/bin/env bash
set -eu

# Update packages list
apt update

# System upgrade
apt -y full-upgrade
