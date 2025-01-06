{
  pkgs,
  config,
  lib,
  ...
}: {
  options.hyprland = {
    enable = lib.mkEnableOption "Hyprland";
  };

  config = lib.mkIf config.hyprland.enable {
    services.xserver.displayManager.startx.enable = true;
    programs.hyprland.enable = true;

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
    };

    security = {
      polkit.enable = true;
    };

    services = {
      gvfs.enable = true;
      devmon.enable = true;
      udisks2.enable = true;
      upower.enable = true;
      power-profiles-daemon.enable = true;
      accounts-daemon.enable = true;
      # gnome = {
      #   evolution-data-server.enable = true;
      #   glib-networking.enable = true;
      #   gnome-keyring.enable = true;
      #   gnome-online-accounts.enable = true;
      #   localsearch.enable = true;
      #   tinysparql.enable = true;
      # };
    };
  };
}