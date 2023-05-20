#!/usr/bin/env bash
set -eu

echo "Script: 55-install-packages-external.sh"

echo " > Installing packages..."

# Install Google Chrome
#wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
#echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' >/etc/apt/sources.list.d/google-chrome.list
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/google.gpg
echo "deb [arch=$ARCH] http://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google-chrome.list >/dev/null
apt-get update
apt-get -y install google-chrome-stable

# Install Cubic
#apt-add-repository -y ppa:cubic-wizard/release
#apt-get update
#apt-get -y install cubic
