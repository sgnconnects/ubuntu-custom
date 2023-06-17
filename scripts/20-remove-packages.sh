#!/usr/bin/env bash
set -eu

echo "Script: 20-remove-packages.sh"

_purge_apt() {
    local PACKAGE=$1

    if dpkg -s "$PACKAGE" &>/dev/null; then
        apt-get -y purge "$PACKAGE"
    fi
}

echo " > Remove unused packages..."
_purge_apt firefox
_purge_apt rhythmbox
_purge_apt thunderbird
_purge_apt totem

# From the file: casper/filesystem.manifest-remove
echo " > Remove language packages (reduce iso size)..."
_purge_apt gnome-user-docs-de
_purge_apt gnome-user-docs-es
_purge_apt gnome-user-docs-fr
_purge_apt gnome-user-docs-it
#_purge_apt gnome-user-docs-pt
_purge_apt gnome-user-docs-ru
_purge_apt gnome-user-docs-zh-hans
_purge_apt hunspell-de-at-frami
_purge_apt hunspell-de-ch-frami
_purge_apt hunspell-de-de-frami
#_purge_apt hunspell-en-au
#_purge_apt hunspell-en-ca
#_purge_apt hunspell-en-gb
#_purge_apt hunspell-en-za
_purge_apt hunspell-es
_purge_apt hunspell-fr
_purge_apt hunspell-fr-classical
_purge_apt hunspell-it
#_purge_apt hunspell-pt-br
#_purge_apt hunspell-pt-pt
_purge_apt hunspell-ru
_purge_apt hyphen-de
#_purge_apt hyphen-en-ca
#_purge_apt hyphen-en-gb
#_purge_apt hyphen-en-us
_purge_apt hyphen-es
_purge_apt hyphen-fr
_purge_apt hyphen-it
#_purge_apt hyphen-pt-br
#_purge_apt hyphen-pt-pt
_purge_apt hyphen-ru
_purge_apt language-pack-de
_purge_apt language-pack-de-base
#_purge_apt language-pack-en
#_purge_apt language-pack-en-base
_purge_apt language-pack-es
_purge_apt language-pack-es-base
_purge_apt language-pack-fr
_purge_apt language-pack-fr-base
_purge_apt language-pack-gnome-de
_purge_apt language-pack-gnome-de-base
#_purge_apt language-pack-gnome-en
#_purge_apt language-pack-gnome-en-base
_purge_apt language-pack-gnome-es
_purge_apt language-pack-gnome-es-base
_purge_apt language-pack-gnome-fr
_purge_apt language-pack-gnome-fr-base
_purge_apt language-pack-gnome-it
_purge_apt language-pack-gnome-it-base
#_purge_apt language-pack-gnome-pt
#_purge_apt language-pack-gnome-pt-base
_purge_apt language-pack-gnome-ru
_purge_apt language-pack-gnome-ru-base
_purge_apt language-pack-gnome-zh-hans
_purge_apt language-pack-gnome-zh-hans-base
_purge_apt language-pack-it
_purge_apt language-pack-it-base
#_purge_apt language-pack-pt
#_purge_apt language-pack-pt-base
_purge_apt language-pack-ru
_purge_apt language-pack-ru-base
_purge_apt language-pack-zh-hans
_purge_apt language-pack-zh-hans-base
#_purge_apt libreoffice-help-common
_purge_apt libreoffice-help-de
#_purge_apt libreoffice-help-en-gb
#_purge_apt libreoffice-help-en-us
_purge_apt libreoffice-help-es
_purge_apt libreoffice-help-fr
_purge_apt libreoffice-help-it
#_purge_apt libreoffice-help-pt
#_purge_apt libreoffice-help-pt-br
_purge_apt libreoffice-help-ru
_purge_apt libreoffice-help-zh-cn
_purge_apt libreoffice-help-zh-tw
_purge_apt libreoffice-l10n-de
#_purge_apt libreoffice-l10n-en-gb
#_purge_apt libreoffice-l10n-en-za
_purge_apt libreoffice-l10n-es
_purge_apt libreoffice-l10n-fr
_purge_apt libreoffice-l10n-it
#_purge_apt libreoffice-l10n-pt
#_purge_apt libreoffice-l10n-pt-br
_purge_apt libreoffice-l10n-ru
_purge_apt libreoffice-l10n-zh-cn
_purge_apt libreoffice-l10n-zh-tw
_purge_apt mythes-de
_purge_apt mythes-de-ch
#_purge_apt mythes-en-au
#_purge_apt mythes-en-us
_purge_apt mythes-es
_purge_apt mythes-fr
_purge_apt mythes-it
#_purge_apt mythes-pt-pt
_purge_apt mythes-ru
#_purge_apt wbrazilian
#_purge_apt wbritish
_purge_apt wfrench
_purge_apt witalian
_purge_apt wngerman
_purge_apt wogerman
#_purge_apt wportuguese
_purge_apt wspanish
_purge_apt wswiss

echo " > Remove others packages..."
apt-get -y --purge autoremove
