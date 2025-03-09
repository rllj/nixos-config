{
  description = "Stormywarm's system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/master";

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    zig.url = "github:mitchellh/zig-overlay";
    firefox.url = "github:nix-community/flake-firefox-nightly";
    zls.url = "github:zigtools/zls";
  };

  outputs = {nixpkgs, ...} @ inputs: let
    inherit (nixpkgs) lib;
  in {
    nixosConfigurations = {
      desktop = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [./configuration.nix];
        specialArgs = {inherit inputs;};
      };
    };
  };
}
