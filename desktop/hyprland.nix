{
  inputs,
  pkgs,
  ...
}: {
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
  # Add common Wayland-related packages
  environment.systemPackages = with pkgs; [
    wl-clipboard # Clipboard utilities
    hyprpaper # Wallpaper
    dunst # Notification daemon
    libnotify # Notification library
    xdg-desktop-portal-hyprland # XDG portal
    rofi-wayland
  ];

  # Configure XDG portals (file pickers, screen sharing)
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    MOZ_ENABLE_WAYLAND = "1";
    XDG_SESSION_TYPE = "wayland";
  };
}
