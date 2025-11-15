#!/bin/bash

pkgs=(
  swaybg
  https://kojipkgs.fedoraproject.org//packages/xwayland-satellite/0.6/1.fc42/x86_64/xwayland-satellite-0.6-1.fc42.x86_64.rpm
  brightnessctl
  wireplumber
  hyprlock
)


if [ "$(id -u)" = 0 ]; then
    echo "This script SHOULD NOT BE RUN AS ROOT"
    exit 1
fi

install_niri() {
  sudo dnf copr enable yalter/niri -y
  sudo dnf install niri -y
}

install_vicinae() {
  if  [ ! "$(command -v vicinae)" ]; then
    curl -fsSL https://vicinae.com/install.sh | bash
  fi
}

echo "niri: "
echo "- pkgs:"
echo ""${pkgs[@]}""

for pkg in "${pkgs[@]}"; do
    if [[ "$pkg" == curl* ]]; then
        eval "$pkg"
    else
        sudo dnf install -y "$pkg"
    fi
done

install_niri
install_vicinae

echo "Completed niri.sh"
echo ""
