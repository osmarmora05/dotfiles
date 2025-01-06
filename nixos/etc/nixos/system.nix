{ pkgs, ... }:

{
  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;
  # Limitar el nùmero de generaciones a conervar
  boot.loader.systemd-boot.configurationLimit = 10;

  # Enable networking
  networking.networkmanager.enable = true;

  # Services
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  # Enable CUPS to print documents.
  services.printing.enable = true;
  # Habilitando flatpaks ? Mejor manejarlo con el home-manager
  services.flatpak.enable = true;
  # Habilitando OpenSSH demonio
  services.openssh.enable = true;

  # packages
  # Install firefox.
  programs.firefox.enable = true;
  programs.dconf.enable = true;
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    home-manager
  ];

  system.stateVersion = "24.11"; # Did you read the comment?
}