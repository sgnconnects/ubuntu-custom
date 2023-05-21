#!/usr/bin/env bash
set -eu

echo "Script: 80-desktop-settings.sh"

echo " > Setting a 'gnome-mimeapps.list' file..."
cp data/gnome-mimeapps.list /usr/share/applications/
chmod 644 /usr/share/applications/gnome-mimeapps.list
chown root:root /usr/share/applications/gnome-mimeapps.list
