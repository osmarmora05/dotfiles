{
 # Set your time zone.
  time.timeZone = "America/Managua";

  # Select internationalisation properties.
  i18n.defaultLocale = "es_NI.UTF-8";

  # Configure console keymap
  console.keyMap = "es";
  
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "es";
    variant = "";
  };
}