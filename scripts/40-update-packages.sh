#!/usr/bin/env bash
set -eu

# Update packages list
apt-get update

# System upgrade
apt-get -y full-upgrade
