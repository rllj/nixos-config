{...}: {
  networking.hostName = "nixos"; 

  networking.networkmanager.enable = true;

  # networking.firewall.allowedTCPPorts = [ 25565 ];
  # networking.firewall.allowedUDPPorts = [ 25565 ];
}
