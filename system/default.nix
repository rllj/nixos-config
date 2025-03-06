{...}: {
  imports = [
    ./boot.nix
    ./locale.nix
    ./networking.nix
  ];

  security.sudo.extraRules = [
    {
      groups = ["wheel"];
      commands = [
        {
          command = "ALL";
          options = ["NOPASSWD"];
        }
      ];
    }
  ];
}
