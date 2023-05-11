#!/usr/bin/env bash
set -eu

echo "Script: 55-install-packages-external.sh"

echo " > Installing packages..."

# Install Brave
#curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
#echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" |tee /etc/apt/sources.list.d/brave-browser-release.list
#apt-get update
#apt-get -y install brave-browser

# Install Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' >/etc/apt/sources.list.d/google-chrome.list
apt-get update
apt-get -y install google-chrome-stable

# Install Cubic
#apt-add-repository -y ppa:cubic-wizard/release
#apt-get update
#apt-get -y install cubic
