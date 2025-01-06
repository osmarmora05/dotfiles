{lib, pkgs, ...}:
with lib.hm.gvariant; {
  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        favorite-apps = [
          "brave-browser.desktop"
          "firefox.desktop"
          "nvim.desktop"
          "org.wezfurlong.wezterm.desktop"
          "org.gnome.Nautilus.desktop"
          "org.gnome.Calendar.desktop"
          "codium.desktop"
          "obsidian.desktop"
          "discord.desktop"
          "com.github.finefindus.eyedropper.desktop"
          "org.gnome.design.Contrast.desktop"
        ];

        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
            dash-to-dock.extensionUuid
            tray-icons-reloaded.extensionUuid
            user-themes.extensionUuid
            color-picker.extensionUuid
          ];      
      };

      "org/gnome/shell/extensions/dash-to-dock" = {
        click-action = "previews";
      };

      "org/gnome/desktop/wm/preferences" = {
        "button-layout" = ":minimize,maximize,close";
      };

      "org/gnome/desktop/interface" = {
        show-battery-percentage = true;
        color-scheme = "prefer-dark";
        focus-mode = "sloppy";
      };
    };
  };
  
  home.packages = with pkgs.gnomeExtensions; [
    dash-to-dock
    tray-icons-reloaded
    user-themes
    color-picker
  ];
}