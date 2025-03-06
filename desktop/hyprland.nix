{pkgs, ...}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
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

  # Recommended environment variables for Hyprland
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # For Electron apps
    WLR_NO_HARDWARE_CURSORS = "1"; # Might help with cursor issues
    MOZ_ENABLE_WAYLAND = "1"; # For Firefox
    XDG_SESSION_TYPE = "wayland";
  };
}
