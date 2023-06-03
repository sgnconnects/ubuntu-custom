#!/usr/bin/env bash
set -eu

echo "Script: 56-install-packages-external-dev.sh"

echo " > Installing packages..."

# Install Visual Studio Code
wget -q -O - https://packages.microsoft.com/keys/microsoft.asc | gpg --batch --yes --dearmor -o /etc/apt/trusted.gpg.d/microsoft.gpg
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | tee /etc/apt/sources.list.d/vscode.list >/dev/null
apt-get update
apt-get install -y code

# Install Cubic
#apt-add-repository -y ppa:cubic-wizard/release
#apt-get update
#apt-get -y install cubic
