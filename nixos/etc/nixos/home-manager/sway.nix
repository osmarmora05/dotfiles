{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    waybar
    wlogout
    swaylock-effects
    wireplumber
    brightnessctl
    rofi
    hyprpicker
    hyprshot
    swaynotificationcenter
  ];
}