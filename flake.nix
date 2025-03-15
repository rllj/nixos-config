{
  description = "Stormywarm's system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/master";

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    zig.url = "github:mitchellh/zig-overlay";
    zls.url = "github:zigtools/zls";
    firefox.url = "github:nix-community/flake-firefox-nightly";
    swww.url = "github:LGFae/swww";
  };

  outputs = {nixpkgs, ...} @ inputs: let
    inherit (nixpkgs.lib) nixosSystem;
  in {
    nixosConfigurations = {
      desktop = nixosSystem {
        system = "x86_64-linux";
        modules = [./configuration.nix];
        specialArgs = {inherit inputs;};
      };
    };
  };
}
