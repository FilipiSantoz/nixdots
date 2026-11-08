{inputs, ...}: {
  flake.homeModules.noctalia = {...}: {
    imports = [inputs.noctalia.homeModules.default];

    programs.noctalia = {
      enable = true;
      settings = {
        launch_apps_as_systemd_services = true;
        theme = {
          mode = "dark";
          source = "builtin";
          builtin = "Catppuccin";
        };
        wallpaper.enabled = true;
      };
    };
  };
}
