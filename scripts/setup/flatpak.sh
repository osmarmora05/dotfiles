#!/bin/bash

flatpak_apps=(
  'com.discordapp.Discord'
  'md.obsidian.Obsidian'
  'org.kde.kontrast'
  'org.localsend.localsend_app'
  'be.alexandervanhee.gradia'
  'tech.dongdongbh.mindwtr'
  'org.onlyoffice.desktopeditors'
  'it.mijorus.gearlever'
  'com.abdownloadmanager.abdownloadmanager'
)

if [ "$(id -u)" = 0 ]; then
    echo "This script SHOULD NOT BE RUN AS ROOT"
    exit 1
fi

if  [ ! "$(command -v flatpak)" ]; then
    echo "You don't have flatpak installed"
    exit 1
fi

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "flatpak: "
echo "- Programs:"
echo ""${flatpak_apps[@]}""

for program in "${flatpak_apps[@]}"; do
    flatpak install flathub "$program" -y --noninteractive
done

echo "Completed flatpak.sh"
echo ""
