#!/bin/bash

pkgs=( 
    # Shell
    fish
    "curl -sS https://starship.rs/install.sh | sh"
    "curl -s https://ohmyposh.dev/install.sh | bash -s"
    
    # Programs
    https://github.com/wez/wezterm/releases/download/20240203-110809-5046fc22/wezterm-20240203_110809_5046fc22-1.fedora39.x86_64.rpm
    neovim
    kitty
    "curl -fsS https://dl.brave.com/install.sh | sh"
    
    # Utilities
    fd-find
    git-delta
    https://github.com/muesli/duf/releases/download/v0.8.1/duf_0.8.1_linux_386.rpm
    wget
    zoxide
    lsd
    cmatrix
    ranger
    bat
    btop
    fastfetch
    htop
    fzf
    cava
    stow
    kde-connect
    inxi
    
    # Development
    nodejs
    "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
)

install_vscode_and_vscodium() {
    # vscode
    echo "- Installing Visual Studio Code..."
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
    sudo dnf install -y code

    # vscodium
    echo "- Installing VSCodium..."
    sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
    printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h\n" | sudo tee -a /etc/yum.repos.d/vscodium.repo
    sudo dnf install -y codium
}

install_duplicati() {
    echo "- Installing duplicati..."
    sudo dnf install -y mono-devel
    sudo dnf install -y https://github.com/duplicati/duplicati/releases/download/v2.0.7.1-2.0.7.1_beta_2023-05-25/duplicati-2.0.7.1-2.0.7.1_beta_20230525.noarch.rpm
}

if [ "$(id -u)" = 0 ]; then
    echo "This script SHOULD NOT BE RUN AS ROOT"
    exit 1
fi

echo "packages: "
echo "- pkgs:"
echo ""${pkgs[@]}""

for pkg in "${pkgs[@]}"; do
    if [[ "$pkg" == curl* ]]; then
        eval "$pkg"
    else
        sudo dnf install -y "$pkg"
    fi
done

install_vscode_and_vscodium
install_duplicati

echo "Completed packages.sh"
echo ""