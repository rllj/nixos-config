{ ... }:
{
  services.xserver.videoDrivers = [ "nvidia" ];
  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "us,no";
  };
  services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager)
  # services.xserver.libinput.enable = true;
}
