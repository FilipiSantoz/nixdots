{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.lunaConfiguration = {...}: {
    imports = [
      #my Machine Hardware
      self.nixosModules.lunaHardware

      # System Modules
      self.nixosModules.audio
      self.nixosModules.compositor
      self.nixosModules.core
      self.nixosModules.docker
      self.nixosModules.fonts
      self.nixosModules.graphics
      self.nixosModules.keyd
      self.nixosModules.openssh
      self.nixosModules.users-santoz

      # User features
      self.nixosModules.niri

      # home-manager
      self.nixosModules.user-dir
      self.nixosModules.user-packages

      inputs.home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {inherit inputs;};
        home-manager.users.santoz = {
          home.stateVersion = "26.05";
          programs.home-manager.enable = true;
          imports = [
            self.homeManagerModules.user-git
            self.homeManagerModules.user-session
            self.homeManagerModules.fetch
            self.homeManagerModules.firefox
            self.homeManagerModules.fzf
            self.homeManagerModules.kitty
            self.homeManagerModules.llama-cpp
            self.homeManagerModules.noctalia
            self.homeManagerModules.obs
            self.homeManagerModules.starship
            self.homeManagerModules.tmux
            self.homeManagerModules.yazi
            self.homeManagerModules.zen
            self.homeManagerModules.zoxide
            self.homeManagerModules.zsh
          ];
        };
      }
    ];
  };
}
