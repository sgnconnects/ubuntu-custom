#!/usr/bin/env bash
set -eu

# Clean apt cache
apt-get -y clean

# Remove residual configs
dpkg -l | grep '^rc' | awk '{print $2}' | xargs apt-get -y purge

# Remove others packages
apt-get -y --purge autoremove

# Removing logs...
find /var/log/* -type f -iname "*log" -exec truncate -s 0 {} \;
find /var/log/* -type f -iname "dmesg" -exec truncate -s 0 {} \;
find /var/log/* -type f -iname "*\.[0-99]" -delete
find /var/log/* -type f -iname "*\.gz*" -delete
find /var/log/* -type f -iname "*\.xz*" -delete
find /var/log/* -type f -iname "*old" -delete

# Clean 'root' user transient files
rm -rf /root/.cache
rm -rf /root/.local
rm -rf /root/.wget-hsts
rm -rf /root/snap
history -c && history -w && rm -rf /root/.bash_history
