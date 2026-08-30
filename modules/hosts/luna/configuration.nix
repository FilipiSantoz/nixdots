{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.lunaConfiguration = {...}: {
    imports = [
      #my Machine Hardware
      self.nixosModules.luaHardware

      # System Modules
      self.nixosModules.core
      self.nixosModules.audio

      # User features

      inputs.home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.userUserPackages = true;
        home-manager.extraSpecialArgs = {inherit inputs;};

        home-manager.users.santoz = {
          home.stateVersion = "26.05";
        };
      }
    ];
  };
}
