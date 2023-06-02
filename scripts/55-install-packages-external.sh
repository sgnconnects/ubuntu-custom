#!/usr/bin/env bash
set -eu

echo "Script: 55-install-packages-external.sh"

echo " > Installing packages..."

# Install Google Chrome
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmour -o /etc/apt/trusted.gpg.d/google.gpg
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google-chrome.list >/dev/null
apt-get update
apt-get -y install google-chrome-stable

# Install Visual Studio Code
wget -q -O - https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/microsoft.gpg
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list >/dev/null
sudo apt update
sudo apt install -y code

# Install Cubic
#apt-add-repository -y ppa:cubic-wizard/release
#apt-get update
#apt-get -y install cubic
