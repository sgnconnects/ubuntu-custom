#!/usr/bin/env bash
set -eu

echo "Script: 80-desktop-settings.sh"

echo " > Setting a 'gnome-mimeapps.list' file..."
cp data/gnome-mimeapps.list /usr/share/applications/
chmod 644 /usr/share/applications/gnome-mimeapps.list
chown root:root /usr/share/applications/gnome-mimeapps.list

echo " > Installing new wallpapers..."
cp data/win-dark.jpg /usr/share/backgrounds/
chmod 644 /usr/share/backgrounds/win-dark.jpg
chown root:root /usr/share/backgrounds/win-dark.jpg

cp data/win-light.jpg /usr/share/backgrounds/
chmod 644 /usr/share/backgrounds/win-light.jpg
chown root:root /usr/share/backgrounds/win-light.jpg

cp data/ubuntu-custom-wallpapers.xml /usr/share/gnome-background-properties/
chmod 644 /usr/share/gnome-background-properties/ubuntu-custom-wallpapers.xml
chown root:root /usr/share/gnome-background-properties/ubuntu-custom-wallpapers.xml

echo " > Setting new desktop configuration..."
cp data/90_ubuntu-custom.gschema.override /usr/share/glib-2.0/schemas/
chmod 644 /usr/share/glib-2.0/schemas/90_ubuntu-custom.gschema.override
chown root:root /usr/share/glib-2.0/schemas/90_ubuntu-custom.gschema.override

glib-compile-schemas /usr/share/glib-2.0/schemas
