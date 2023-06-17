#!/usr/bin/env bash
set -eu

echo "Script: 60-optimizations.sh"

echo " > Adjust swappiness: uses 90% of RAM before Linux kernel begins swapping..."
echo "vm.swappiness=10" >>/etc/sysctl.conf

echo " > Adjust for VSCode and Insync..."
echo "fs.inotify.max_user_watches=1048576" >>/etc/sysctl.conf

echo " > Disable apport..."
sed -i "s|enabled=1|enabled=0|" /etc/default/apport

echo " > FIX: shutdown timeout..."
sed -i "s|^[ #]*DefaultTimeoutStopSec=90s|DefaultTimeoutStopSec=10s|" /etc/systemd/system.conf

echo " > FIX: write permission with PDF in ImageMagick..."
sed -i 's/rights="none" pattern="PDF"/rights="read|write" pattern="PDF"/' /etc/ImageMagick-6/policy.xml

echo " > FIX: use Wayland in GDM..."
sed -i "s|^[ #]*WaylandEnable=false|WaylandEnable=true|" /etc/gdm3/custom.conf

echo " > FIX: better typing in Portuguese (Brazil) using US keyboards: double quote key..."
sed -i "s|dead_acute,[ ]*dead_diaeresis,[ ]*apostrophe,[ ]*quotedbl|dead_acute, quotedbl|" /usr/share/X11/xkb/symbols/us
