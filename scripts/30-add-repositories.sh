#!/usr/bin/env bash
set -eu

_log "Removing apt lists..."
rm -rf /var/lib/apt/lists/*ubuntu_dists*

# Creating new 'sources.list'...
cat >"/etc/apt/sources.list" <<EOF
deb http://br.archive.ubuntu.com/ubuntu/ jammy main multiverse universe restricted
deb http://br.archive.ubuntu.com/ubuntu/ jammy-updates main multiverse universe restricted
deb http://br.archive.ubuntu.com/ubuntu/ jammy-backports main multiverse universe restricted
deb http://security.ubuntu.com/ubuntu jammy-security main multiverse universe restricted
EOF

# Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' >/etc/apt/sources.list.d/google-chrome.list

# Cubic
#apt-add-repository -y ppa:cubic-wizard/release

# Update packages list
apt-get update
