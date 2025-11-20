{
  pkgs,
  ...
}:
{
  virtualisation.containers.enable = true;
  virtualisation = {
    podman = {
      enable = true;

      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  environment.systemPackages = with pkgs; [
    git
    zsh
    gcc
    clang
    ripgrep
    xclip
    wl-clipboard
    unzip
    jdk21
  ];
}
