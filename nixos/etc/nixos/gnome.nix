{
  pkgs,
  lib,
  config,
  ...
}: {
  options.gnome = {
    enable = lib.mkEnableOption "Gnome";
  };

  config = lib.mkIf config.gnome.enable {
    environment = {
      systemPackages = with pkgs; [
        gnome-tweaks
        gnome-extension-manager
      ];

      gnome.excludePackages = with pkgs; [
        gnome-text-editor
        gnome-console
        gnome-photos
        gnome-tour
        gnome-connections
        snapshot
        gedit
        cheese # webcam tool
        geary # email reader
        evince # document viewer
        totem # video player
        yelp # Help view
        gnome-font-viewer
        gnome-shell-extensions
        gnome-maps
        gnome-music
        gnome-characters
        gnome-contacts
        gnome-initial-setup

      ];
    };

    programs.kdeconnect.package = pkgs.gnomeExtensions.gsconnect;
    services.gnome.gnome-keyring.enable = true;

    services.xserver = {
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
  };
}