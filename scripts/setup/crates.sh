#!/bin/bash

crates=(
  serie # git commit graph
  impala # TUI wifi for iwd
  bluetui # TUI bluetooth for bluez
  wiremix # TUI audio mixer for PipeWire
  tray-tui # TUI for management system tray
)


if [ "$(id -u)" = 0 ]; then
    echo "This script SHOULD NOT BE RUN AS ROOT"
    exit 1
fi

if  [ ! "$(command -v cargo)" ]; then
    echo "You dont' have cargo installed"
    exit 1
fi

echo "cargo packages: "
echo "- pkgs:"
echo ""${pkgs[@]}""

for pkg in "${pkgs[@]}"; do
    cargo install "$pkg"
done

echo "Completed crates.sh"
echo ""
