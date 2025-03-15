{
  inputs,
  pkgs,
  ...
}: {
  # Enable common container config files in /etc/containers
  virtualisation.containers.enable = true;
  virtualisation = {
    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  environment.systemPackages = with pkgs; [
    git
    inputs.neovim-nightly-overlay.packages.${pkgs.system}.default
    inputs.firefox.packages.${pkgs.system}.firefox-nightly-bin
    inputs.zig.packages.${pkgs.system}.master
    inputs.zls.packages.${pkgs.system}.zls
    inputs.swww.packages.${pkgs.system}.swww
    cargo
    rust-analyzer
    cowsay
    zsh
    gcc
    clang
    ripgrep
    fd
    fzf
    mangohud
    vulkan-loader
    vulkan-validation-layers
    vulkan-tools
    xclip
    wl-clipboard
    samply
    cargo
    unzip
    gimp
    podman-compose
    fastfetch
  ];
}
