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

      # home-manager
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {inherit inputs;};
        home-manager.users.santoz = {
          home.stateVersion = "26.05";
        };
      }
    ];
  };
}
