#!/usr/bin/env bash
set -eu

echo "Script: 30-add-repositories.sh"

echo " > Removing old apt lists..."
rm -rf /var/lib/apt/lists/*ubuntu_dists*

echo " > Creating new 'sources.list'..."
CODENAME=$(lsb_release -cs)
cat >"/etc/apt/sources.list" <<EOF
deb http://br.archive.ubuntu.com/ubuntu/ $CODENAME main restricted
deb http://br.archive.ubuntu.com/ubuntu/ $CODENAME-updates main restricted
deb http://br.archive.ubuntu.com/ubuntu/ $CODENAME universe
deb http://br.archive.ubuntu.com/ubuntu/ $CODENAME-updates universe
deb http://br.archive.ubuntu.com/ubuntu/ $CODENAME multiverse
deb http://br.archive.ubuntu.com/ubuntu/ $CODENAME-updates multiverse
deb http://br.archive.ubuntu.com/ubuntu/ $CODENAME-backports main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu $CODENAME-security main restricted
deb http://security.ubuntu.com/ubuntu $CODENAME-security universe
deb http://security.ubuntu.com/ubuntu $CODENAME-security multiverse
EOF

echo " > Update package list..."
apt-get update
