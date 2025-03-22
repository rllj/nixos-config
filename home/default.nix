{...}: {
  imports = [
    ./waybar.nix
    ./hyprland
  ];

  home.username = "rllj";
  home.homeDirectory = "/home/rllj";

  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
