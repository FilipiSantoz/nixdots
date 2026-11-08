{
  self,
  inputs,
  ...
}:
{
  flake.nixosConfigurations.serez = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = { inherit inputs; };
    modules = [
      self.nixosModules.serezConfiguration
    ];
  };
}
