#!/usr/bin/env bash
set -eu

echo "Script: 80-desktop-settings.sh"

# Configuration based on:
# grep -r "mime-type[ ]*type" /usr/share/mime/packages | cut -d "=" -f 2 | sed "s|\">||" | sed "s|\"||" | sort --unique
# See also: /usr/share/gdm/greeter/applications/mimeapps.list
echo " > Setting mimeapps file..."
install -o root -m 644 data/mimeapps.list /etc/xdg/mimeapps.list
update-desktop-database

echo " > Installing wallpapers..."
install -o root -m 644 data/windows-dark.jpg /usr/share/backgrounds/windows-dark.jpg
install -o root -m 644 data/windows-light.jpg /usr/share/backgrounds/windows-light.jpg
install -o root -m 644 data/windows-wallpapers.xml /usr/share/gnome-background-properties/windows-wallpapers.xml

if [[ -d "data/microsoft-core-fonts" ]]; then
    echo " > Installing Microsoft core fonts..."
    mkdir -p /usr/share/fonts/truetype/microsoft-core-fonts
    cp -r data/microsoft-core-fonts/* /usr/share/fonts/truetype/microsoft-core-fonts
    chmod 644 /usr/share/fonts/truetype/microsoft-core-fonts/*
fi

echo " > Setting desktop configuration..."
install -o root -m 644 data/90_ubuntu-custom.gschema.override /usr/share/glib-2.0/schemas/90_ubuntu-custom.gschema.override
glib-compile-schemas /usr/share/glib-2.0/schemas

echo " > Setting default mime types..."
install -o root -m 644 data/mime/*.xml /usr/share/mime/packages/
update-mime-database /usr/share/mime

echo " > Setting apps default configs..."
cp -r data/skel/. /etc/skel/
find /etc/skel/ -type f -exec chmod 644 {} \;
find /etc/skel/ -type d -exec chmod 755 {} \;
