{
  inputs,
  pkgs,
  ...
}: {
  virtualisation.containers.enable = true;
  virtualisation = {
    podman = {
      enable = true;

      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  environment.systemPackages = with pkgs; [
    git
    inputs.neovim-nightly-overlay.packages.${pkgs.system}.default
    inputs.firefox.packages.${pkgs.system}.firefox-nightly-bin
    inputs.zig.packages.${pkgs.system}.master
    inputs.swww.packages.${pkgs.system}.swww
    inputs.waybar.packages.${pkgs.system}.waybar
    zls
    hyperfine
    pkgs.linuxPackages_latest.perf
    cargo
    rust-analyzer
    zsh
    gcc
    clang
    ripgrep
    fd
    fzf
    xclip
    wl-clipboard
    samply
    cargo
    unzip
    gimp
    jdk21
    bat
    cloc
    direnv
    gtypist
    xxd
  ];
}
