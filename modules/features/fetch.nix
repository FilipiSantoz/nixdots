{ inputs, ... }: {
  flake.homeModules.fetch = { ... }: {
    imports = [ inputs.areofyl-fetch.homeManagerModules.default ];

    programs.fetch = {
      enable = true;
      labelColor = "cyan";
      light = "top-left";
      spin = "xy";
      speed = 1.0;
    };
  };
}
