{pkgs, ...}: {
  users.users.rllj = {
    isNormalUser = true;
    description = "Ruben Lee Landroe Johnsen";
    extraGroups = ["networkmanager" "wheel"];
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
    ];
  };
}
