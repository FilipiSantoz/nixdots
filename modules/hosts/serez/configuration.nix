{
  self,
  ...
}:
{
  flake.nixosModules.serezConfiguration = { ... }: {
    networking.hostName = "serez";

    imports = [
      self.nixosModules.serezHardware

      # System Modules
      self.nixosModules.audio
      self.nixosModules.compositor
      self.nixosModules.core
      self.nixosModules.docker
      self.nixosModules.fonts
      self.nixosModules.graphics
      self.nixosModules.keyd
      self.nixosModules.openssh

      # Window Manager
      self.nixosModules.niri

      # User Profile
      self.nixosModules.user-santoz
    ];
  };
}
