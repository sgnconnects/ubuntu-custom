#!/usr/bin/env bash
set -eu

echo "Script: 90-clean.sh"

echo " > Clean apt cache..."
apt-get -y clean

echo " > Remove residual configs..."
dpkg --list | grep '^rc' | awk '{print $2}' | xargs apt-get -y purge

echo " > Remove others packages..."
apt-get -y --purge autoremove

echo " > Removing logs......"
find /var/log/* -type f -iname "*log" -exec truncate -s 0 {} \;
find /var/log/* -type f -iname "dmesg" -exec truncate -s 0 {} \;
find /var/log/* -type f -iname "*\.[0-99]" -delete
find /var/log/* -type f -iname "*\.gz*" -delete
find /var/log/* -type f -iname "*\.xz*" -delete
find /var/log/* -type f -iname "*old" -delete

echo " > Clean 'root' user transient files..."
rm -rf /root/.cache
rm -rf /root/.local
rm -rf /root/.wget-hsts
rm -rf /root/snap
history -c && history -w && rm -rf /root/.*history
