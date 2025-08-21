{
  description = "Stormywarm's system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/master";

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    zig.url = "github:mitchellh/zig-overlay";
    zls.url = "github:zigtools/zls";
    firefox.url = "github:nix-community/flake-firefox-nightly";
    swww.url = "github:LGFae/swww";
    hyprland.url = "github:hyprwm/Hyprland";
    waybar.url = "github:Alexays/Waybar";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      inherit (nixpkgs.lib) nixosSystem;
    in
    {
      nixosConfigurations = {
        desktop = nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.users.rllj = import ./home;
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
            }
          ];
          specialArgs = { inherit inputs; };
        };
      };
    };
}
