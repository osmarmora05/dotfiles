{ pkgs, ... }:

{ 
  home.packages = with pkgs; [
    nodejs
    python313
  ];
}