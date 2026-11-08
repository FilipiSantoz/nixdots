{
  self,
  inputs,
  ...
}:
{
  flake.homeModules.santoz = { ... }: {
    imports = [
      self.homeModules.user-dir
      self.homeModules.user-packages
      self.homeModules.user-session
      self.homeModules.fetch
      self.homeModules.firefox
      self.homeModules.fzf
      self.homeModules.ghostty
      self.homeModules.git
      self.homeModules.kitty
      self.homeModules.llama-cpp
      self.homeModules.noctalia
      self.homeModules.obs
      self.homeModules.starship
      self.homeModules.tmux
      self.homeModules.yazi
      self.homeModules.zen
      self.homeModules.zoxide
      self.homeModules.zsh
    ];

    programs.git.settings.user = {
      name = "FilipiSantoz";
      email = "239681201+FilipiSantoz@users.noreply.github.com";
    };
  };

  flake.nixosModules.user-santoz = { pkgs, ... }: {
    imports = [
      inputs.home-manager.nixosModules.home-manager
    ];

    programs.zsh.enable = true;

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

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit inputs; };
      users.santoz = {
        home.stateVersion = "26.05";
        programs.home-manager.enable = true;
        imports = [
          self.homeModules.santoz
        ];
      };
    };
  };
}
