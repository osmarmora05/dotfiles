{ config, pkgs, ... }:

let
  pkgs = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/05bbf675397d5366259409139039af8077d695ce.tar.gz";
  }) {};
  
  myPkg = pkgs.duplicati;
in

{
  home.packages = with pkgs; [
    myPkg
  ];
}