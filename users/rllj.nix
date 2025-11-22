{ inputs, pkgs, ... }:
let
  inherit (pkgs.stdenv.hostPlatform) system;
in
{
  users.users.rllj = {
    isNormalUser = true;
    description = "rllj";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      ghostty
      alacritty
      discord
      spotify
      atuin
      alejandra
      nil
      stylua
      gopls
      tree
      gnumake
      ninja
      ffmpeg
      python3
      hyperfine
      perf
      cargo
      rust-analyzer
      inputs.neovim-nightly-overlay.packages.${system}.default
      inputs.firefox.packages.${system}.firefox-nightly-bin
      inputs.zig.packages.${system}.master
      inputs.swww.packages.${system}.swww
      inputs.waybar.packages.${system}.waybar
      inputs.zls.packages.${system}.zls # master
      clang-tools
      samply
      gimp
      xxd
      gtypist
      direnv
      bat
      fd
      fzf
      cloc
      feh
      rofi
    ];
  };
}
