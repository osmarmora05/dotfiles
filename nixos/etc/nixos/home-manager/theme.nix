{
  pkgs,
  config,
  inputs,
  ...
}: let
  cursorTheme = {
    name = "MacOS-BigSur";
    size = 24;
    package = pkgs.apple-cursor;
  };
in {
  home = {
    packages = with pkgs; [
      # theme.package
      ( nerdfonts.override { fonts = [ "Iosevka" "CascadiaCode" "RobotoMono" ]; }  )
      open-sans
      ibm-plex
      # cursorTheme.package
    ];
    file.".local/share/fonts".source = "${config.home.path}/share/fonts";
    # file.".local/share/icons".source = "${config.home.path}/share/icons";
  };

  fonts.fontconfig.enable = true;

  # gtk = {
  #   inherit cursorTheme ;
  #   theme.name = cursorTheme.name;
  #   enable = true;
  # };
}