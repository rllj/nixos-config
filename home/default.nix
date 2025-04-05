{pkgs, ...}: {
  imports = [
    ./waybar.nix
    ./hyprland.nix
  ];

  home.username = "rllj";
  home.homeDirectory = "/home/rllj";

  home.stateVersion = "24.11";

  home.packages = with pkgs; [prismlauncher];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
