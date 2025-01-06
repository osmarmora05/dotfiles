{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    brightnessctl
    pulseaudio 
    playerctl
    swww
    slurp
    hyprshot
    dart-sass
    swww
    bun
    fd
    matugen
  ];
}