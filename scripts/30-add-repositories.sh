#!/usr/bin/env bash
set -eu

# Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' >/etc/apt/sources.list.d/google-chrome.list

# Cubic
#apt-add-repository -y ppa:cubic-wizard/release
