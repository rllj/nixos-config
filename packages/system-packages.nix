{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    git
    inputs.neovim-nightly-overlay.packages.${pkgs.system}.default
    inputs.firefox.packages.${pkgs.system}.firefox-nightly-bin
    inputs.zig.packages.${pkgs.system}.master
    inputs.zls.packages.${pkgs.system}.zls
    cowsay
    zsh
    gcc
    zig
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
  ];
}
