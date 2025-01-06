{ config, pkgs, ... }:

{ 
  imports = [
    ./home-manager/git.nix
    ./home-manager/dev.nix
    ./home-manager/packages.nix
    ./home-manager/dconf.nix
    ./home-manager/theme.nix
    ./home-manager/hyprland.nix
    ./home-manager/sway.nix
    ./home-manager/browsers.nix
    ./pkgs/ags.nix
  ];

  # home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
