{ inputs, pkgs, ... }:
{
  users.users.rllj = {
    isNormalUser = true;
    description = "Ruben Lee Landroe Johnsen";
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
      make
      ninja
      ffmpeg
      python3
      hyperfine
      pkgs.linuxPackages_latest.perf
      cargo
      rust-analyzer
      inputs.neovim-nightly-overlay.packages.${pkgs.system}.default
      inputs.firefox.packages.${pkgs.system}.firefox-nightly-bin
      inputs.zig.packages.${pkgs.system}.master
      inputs.swww.packages.${pkgs.system}.swww
      inputs.waybar.packages.${pkgs.system}.waybar
      inputs.zls.packages.${pkgs.system}.zls # master
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
    ];
  };
}
