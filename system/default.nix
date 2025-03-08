{...}: {
  imports = [
    ./boot.nix
    ./locale.nix
    ./networking.nix
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    persistent = true;
    options = "--delete-older-than 30d";
  };
  nix.settings.auto-optimise-store = true;
}
