#!/usr/bin/env bash
set -eu

echo "Script: 80-desktop-settings.sh"

echo " > Setting a 'gnome-mimeapps.list' file..."
install -o root -m 644 data/gnome-mimeapps.list /usr/share/applications/gnome-mimeapps.list

echo " > Installing new wallpapers..."
install -o root -m 644 data/win-dark.jpg /usr/share/backgrounds/win-dark.jpg
install -o root -m 644 data/win-light.jpg /usr/share/backgrounds/win-light.jpg
install -o root -m 644 data/ubuntu-custom-wallpapers.xml /usr/share/gnome-background-properties/ubuntu-custom-wallpapers.xml

echo " > Setting new desktop configuration..."
install -o root -m 644 data/90_ubuntu-custom.gschema.override /usr/share/glib-2.0/schemas/90_ubuntu-custom.gschema.override
glib-compile-schemas /usr/share/glib-2.0/schemas

echo " > Setting app default configs..."
mkdir -p /etc/skel/.config/
cp -r data/config/* /etc/skel/.config/
chmod -R 644 /etc/skel/.config/
find /etc/skel/.config/ -type f -exec chmod 644 {} \;
find /etc/skel/.config/ -type d -exec chmod 755 {} \;

echo " > Setting new mime types..."
install -o root -m 644 data/mime/*.xml /usr/share/mime/packages/
update-mime-database /usr/share/mime