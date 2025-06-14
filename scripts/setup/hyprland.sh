#!/bin/bash

pkgs=(
    hyprland
    wireplumber
    brightnessctl
    grim
    slurp
    wl-clipboard
    notifi-send
    https://kojipkgs.fedoraproject.org//packages/hyprpicker/0.4.1/1.fc41/x86_64/hyprpicker-0.4.1-1.fc41.x86_64.rpm
    "curl -fsSL https://bun.sh/install | bash"
    fzf
    fd
    https://repos.fyralabs.com/terra41/swww-0:0.9.5-1.fc41.x86_64.rpm
    hyprlock
)

install_dart-sass() {
    echo "- Installing dart-sass"
    cd /tmp/
    wget https://github.com/sass/dart-sass/releases/download/1.77.0/dart-sass-1.77.0-linux-x64.tar.gz
    tar -xzf dart-sass-1.77.0-linux-x64.tar.gz
    cd dart-sass
    sudo cp -rf * /usr/local/bin/
}

install_matugen() {
    if [ ! "$(command -v cargo)" ];  then
        echo "You dont' have rust, therefore matugen cannot be installed"
        exit 1
    fi
    sudo dnf install gcc make
    echo "- Installing matugen"
    cargo install matugen
}

install_ags() {
    echo "- Installing ags"

    ags="https://github.com/Aylur/ags/releases/download/v1.8.2/ags-v1.8.2.tar.gz"
    wget "$ags" -P /tmp/
    if [ $? -ne 0 ]; then
        echo "Error downloading the theme. Please check the URL"
        exit 1
    fi

    tar -xvf /tmp/ags-v1.8.2.tar.gz -C /tmp
    
    if [ $? -ne 0 ]; then
        echo "Error extracting the file"
        exit 1
    fi

    echo "  - Installing dependences..."
    sudo dnf install -y typescript npm meson gjs-devel gtk3-devel gtk-layer-shell gnome-bluetooth upower NetworkManager pulseaudio-libs-devel libdbusmenu-gtk3 libsoup3 cmake pam-devel

    
    cd /tmp/ags/
    npm install
    meson setup build
    sudo meson install -C build

    if [ $? -ne 0 ]; then
        echo "An error ocurred while installing ags"
        exit 1
    fi

    rm -rf /tmp/ags-v1.8.2.tar.gz /tmp/ags
}

if [ "$(id -u)" = 0 ]; then
    echo "This script SHOULD NOT BE RUN AS ROOT"
    exit 1
fi

echo "hyprland: "
echo "- pkgs:"
echo ""${pkgs[@]}""

for pkg in "${pkgs[@]}"; do
    if [[ "$pkg" == curl* ]]; then
        eval "$pkg"
    else
        sudo dnf install -y "$pkg"
    fi
done

install_dart-sass
install_matugen
install_ags

echo "Completed hyprland.sh"
echo ""
