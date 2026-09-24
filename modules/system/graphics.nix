{ ... }: {
  flake.nixosModules.graphics = { ... }: {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
    security.polkit.enable = true;
  };
}
