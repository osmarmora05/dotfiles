{ pkgs, ... }:

{ 
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; } # Dark Reader
      { id = "bggfcpfjbdkhfhfmkjpbhnkhnpjjeomc"; } # Material Icons for Github
      { id = "eenjdnjldapjajjofmldgmkjaienebbj"; } # Copyfish 🐟 Free OCR Software
      { id = "cdockenadnadldjbbgcallicgledbeoc"; } # VisBug
      { id = "aapbdbdomjkkjkaonfhkkikfgjllcleb"; } # Traductor de Google
    ];
  };
}