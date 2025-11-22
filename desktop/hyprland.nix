{
  inputs,
  pkgs,
  ...
}:
let
  inherit (pkgs.stdenv.hostPlatform) system;
in
{
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${system}".hyprland;
    portalPackage = inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland;
  };
  environment.systemPackages = with pkgs; [
    wl-clipboard
    dunst
    libnotify
    xdg-desktop-portal-hyprland
    hyprshot
  ];

  services.xserver.displayManager.lightdm.enable = false;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    MOZ_ENABLE_WAYLAND = "1";
    XDG_SESSION_TYPE = "wayland";
  };
}
