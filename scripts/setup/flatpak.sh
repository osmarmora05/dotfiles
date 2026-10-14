#!/bin/bash

flatpak_apps=(
  'com.discordapp.Discord'
  'com.github.finefindus.eyedropper'
  'com.github.zocker_160.SyncThingy'
  'md.obsidian.Obsidian'
  'org.kde.kontrast'
  'com.librumreader.librum'
  'org.localsend.localsend_app'
  'be.alexandervanhee.gradia'
  'tech.dongdongbh.mindwtr'
  'org.onlyoffice.desktopeditors'
  'it.mijorus.gearlever'
)

if [ "$(id -u)" = 0 ]; then
    echo "This script SHOULD NOT BE RUN AS ROOT"
    exit 1
fi

if  [ ! "$(command -v flatpak)" ]; then
    echo "You don't have flatpak installed"
    exit 1
fi

echo "flatpak: "
echo "- Programs:"
echo ""${flatpak_apps[@]}""

for program in "${flatpak_apps[@]}"; do
    flatpak install flathub "$program" -y --noninteractive
done

echo "Completed flatpak.sh"
echo ""
