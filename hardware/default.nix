{ ... }:
{
  imports = [
    ./nvidia.nix
    ./audio.nix
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.udisks2.enable = true;
}
