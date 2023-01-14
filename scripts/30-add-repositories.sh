#!/usr/bin/env bash
set -eu

echo "Removing old apt lists..."
rm -rf /var/lib/apt/lists/*ubuntu_dists*

echo "Creating new 'sources.list'..."
cat >"/etc/apt/sources.list" <<EOF
deb http://br.archive.ubuntu.com/ubuntu/ jammy main restricted
deb http://br.archive.ubuntu.com/ubuntu/ jammy-updates main restricted
deb http://br.archive.ubuntu.com/ubuntu/ jammy universe
deb http://br.archive.ubuntu.com/ubuntu/ jammy-updates universe
deb http://br.archive.ubuntu.com/ubuntu/ jammy multiverse
deb http://br.archive.ubuntu.com/ubuntu/ jammy-updates multiverse
deb http://br.archive.ubuntu.com/ubuntu/ jammy-backports main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu jammy-security main restricted
deb http://security.ubuntu.com/ubuntu jammy-security universe
deb http://security.ubuntu.com/ubuntu jammy-security multiverse
EOF

echo "Add 'Google Chrome' list..."
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' >/etc/apt/sources.list.d/google-chrome.list

#echo "Add 'Cubic' list..."
#apt-add-repository -y ppa:cubic-wizard/release

echo "Update package list..."
apt-get update
