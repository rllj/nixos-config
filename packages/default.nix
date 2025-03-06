{...}: {
  imports = [
    ./system-packages.nix
    ./programs.nix
  ];

  nixpkgs.config.allowUnfree = true;
}
