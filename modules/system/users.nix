{ ... }: {
  flake.nixosModules.users-santoz = { pkgs, ... }: {
    users.users.santoz = {
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = [
        "wheel"
        "networkmanager"
        "video"
        "audio"
        "input"
        "docker"
        "render"
      ];
    };
    programs.zsh.enable = true;
  };
}
