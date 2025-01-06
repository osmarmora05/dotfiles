{ lib, pkgs, ... }:

let 
  name = "osmarmora05";
in {
  programs.git = {
    enable = true;
    extraConfig = {
      color.ui = true;
      core.editor = "codium";
      github.user = name;
      push.autoSetupRemote = true;
    };
    userEmail = "osmaradrianmoracerna@gmail.com";
    userName = name;
  };

  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
  };

  services.ssh-agent = {
    enable = lib.modules.mkIf pkgs.stdenv.isLinux true;
  };
}