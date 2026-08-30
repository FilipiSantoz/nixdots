{
  self,
  inputs,
  ...
}: {
  flake.nixosConfiguration.luna = inputs.nixpkgs.nixosSystem {
    system = "x86_64-linux";
    specialArgs = {inherit inputs;};
    modules = [
      self.nixosModules.lunaConfiguration
    ];
  };
}
