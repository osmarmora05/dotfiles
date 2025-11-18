#!/bin/bash

pkgs=(
    sway
    waybar
    wlgout
    swaylock
    wireplumber
    brightnessctl
    rofi
    wl-clipboard
    notifi-send
    https://kojipkgs.fedoraproject.org//packages/hyprpicker/0.4.1/1.fc41/x86_64/hyprpicker-0.4.1-1.fc41.x86_64.rpm
    grim 
    slurp 
    jq
    grimshot
    hyprlock
)

install_SwayNotificationCenter-git() {
    sudo dnf copr enable erikreider/SwayNotificationCenter
    sudo dnf install SwayNotificationCenter-git
}

if [ "$(id -u)" = 0 ]; then
    echo "This script SHOULD NOT BE RUN AS ROOT"
    exit 1
fi

echo "sway: "
echo "- pkgs:"
echo ""${pkgs[@]}""

for pkg in "${pkgs[@]}"; do
    sudo dnf install -y "$pkg"
done

install_SwayNotificationCenter-git

echo "Completed sway.sh"
echo ""
