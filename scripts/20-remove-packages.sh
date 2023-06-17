#!/usr/bin/env bash
set -eu

echo "Script: 20-remove-packages.sh"

echo " > Remove unused packages..."
apt-get -y purge firefox
apt-get -y purge rhythmbox
apt-get -y purge thunderbird
apt-get -y purge totem

# From the file: casper/filesystem.manifest-remove
echo " > Remove language packages (reduce iso size)..."
apt-get -y purge gnome-user-docs-de
apt-get -y purge gnome-user-docs-es
apt-get -y purge gnome-user-docs-fr
apt-get -y purge gnome-user-docs-it
#apt-get -y purge gnome-user-docs-pt
apt-get -y purge gnome-user-docs-ru
apt-get -y purge gnome-user-docs-zh-hans
apt-get -y purge hunspell-de-at-frami
apt-get -y purge hunspell-de-ch-frami
apt-get -y purge hunspell-de-de-frami
apt-get -y purge hunspell-en-au
apt-get -y purge hunspell-en-ca
apt-get -y purge hunspell-en-gb
apt-get -y purge hunspell-en-za
apt-get -y purge hunspell-es
apt-get -y purge hunspell-fr
apt-get -y purge hunspell-fr-classical
apt-get -y purge hunspell-it
#apt-get -y purge hunspell-pt-br
#apt-get -y purge hunspell-pt-pt
apt-get -y purge hunspell-ru
apt-get -y purge hyphen-de
apt-get -y purge hyphen-en-ca
apt-get -y purge hyphen-en-gb
#apt-get -y purge hyphen-en-us
apt-get -y purge hyphen-es
apt-get -y purge hyphen-fr
apt-get -y purge hyphen-it
#apt-get -y purge hyphen-pt-br
#apt-get -y purge hyphen-pt-pt
apt-get -y purge hyphen-ru
apt-get -y purge language-pack-de
apt-get -y purge language-pack-de-base
#apt-get -y purge language-pack-en
#apt-get -y purge language-pack-en-base
apt-get -y purge language-pack-es
apt-get -y purge language-pack-es-base
apt-get -y purge language-pack-fr
apt-get -y purge language-pack-fr-base
apt-get -y purge language-pack-gnome-de
apt-get -y purge language-pack-gnome-de-base
#apt-get -y purge language-pack-gnome-en
#apt-get -y purge language-pack-gnome-en-base
apt-get -y purge language-pack-gnome-es
apt-get -y purge language-pack-gnome-es-base
apt-get -y purge language-pack-gnome-fr
apt-get -y purge language-pack-gnome-fr-base
apt-get -y purge language-pack-gnome-it
apt-get -y purge language-pack-gnome-it-base
#apt-get -y purge language-pack-gnome-pt
#apt-get -y purge language-pack-gnome-pt-base
apt-get -y purge language-pack-gnome-ru
apt-get -y purge language-pack-gnome-ru-base
apt-get -y purge language-pack-gnome-zh-hans
apt-get -y purge language-pack-gnome-zh-hans-base
apt-get -y purge language-pack-it
apt-get -y purge language-pack-it-base
#apt-get -y purge language-pack-pt
#apt-get -y purge language-pack-pt-base
apt-get -y purge language-pack-ru
apt-get -y purge language-pack-ru-base
apt-get -y purge language-pack-zh-hans
apt-get -y purge language-pack-zh-hans-base
#apt-get -y purge libreoffice-help-common
apt-get -y purge libreoffice-help-de
apt-get -y purge libreoffice-help-en-gb
#apt-get -y purge libreoffice-help-en-us
apt-get -y purge libreoffice-help-es
apt-get -y purge libreoffice-help-fr
apt-get -y purge libreoffice-help-it
#apt-get -y purge libreoffice-help-pt
#apt-get -y purge libreoffice-help-pt-br
apt-get -y purge libreoffice-help-ru
apt-get -y purge libreoffice-help-zh-cn
apt-get -y purge libreoffice-help-zh-tw
apt-get -y purge libreoffice-l10n-de
apt-get -y purge libreoffice-l10n-en-gb
apt-get -y purge libreoffice-l10n-en-za
apt-get -y purge libreoffice-l10n-es
apt-get -y purge libreoffice-l10n-fr
apt-get -y purge libreoffice-l10n-it
#apt-get -y purge libreoffice-l10n-pt
#apt-get -y purge libreoffice-l10n-pt-br
apt-get -y purge libreoffice-l10n-ru
apt-get -y purge libreoffice-l10n-zh-cn
apt-get -y purge libreoffice-l10n-zh-tw
apt-get -y purge mythes-de
apt-get -y purge mythes-de-ch
apt-get -y purge mythes-en-au
#apt-get -y purge mythes-en-us
apt-get -y purge mythes-es
apt-get -y purge mythes-fr
apt-get -y purge mythes-it
#apt-get -y purge mythes-pt-pt
apt-get -y purge mythes-ru
#apt-get -y purge wbrazilian
#apt-get -y purge wbritish
apt-get -y purge wfrench
apt-get -y purge witalian
apt-get -y purge wngerman
apt-get -y purge wogerman
#apt-get -y purge wportuguese
apt-get -y purge wspanish
apt-get -y purge wswiss

echo " > Remove others packages..."
apt-get --purge autoremove
