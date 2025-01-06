{ pkgs, ... }:

{ 
  home.packages = with pkgs; [
    # Shell
    fish
    oh-my-posh
    starship

    # Programs
    vscodium
    wezterm
    neovim
    kitty
    brave
    firefox

    # Utils
    fd
    delta
    duf
    wget
    zoxide
    lsd
    cmatrix
    unimatrix
    ranger
    bat
    btop
    fastfetch
    htop
    fzf
    cava
    stow 

    # util backup
    duplicati # 2.0.8.1
  ];
}