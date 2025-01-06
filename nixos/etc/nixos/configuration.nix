{ config, pkgs,  lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      <home-manager/nixos>
      ./locale.nix
      ./audio.nix
      ./hyprland.nix
      ./system.nix
    ];

  networking.hostName = "nixos";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  users.users.osmar = {
    isNormalUser = true;
    description = "osmar";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Weekly garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-order-than 1w";
  };
  
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.osmar = {
      home.username = "osmar";
      home.homeDirectory = "/home/osmar";
      home.stateVersion = "24.11";
      imports = [ ./home.nix ];
    };
  };

  hyprland.enable = true;
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
  
  specialisation = {
    gnome.configuration = {
      imports = [./gnome.nix];
      system.nixos.tags = ["Gnome"];
      gnome.enable = true;
    };
  };
}