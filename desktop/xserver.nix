{...}: {
  services.xserver.videoDrivers = ["nvidia"];
  services.xserver.enable = true;
  services.xserver.xkb.options = "caps:escape";
  services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager)
  # services.xserver.libinput.enable = true;
}
