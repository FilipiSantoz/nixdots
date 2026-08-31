{...}: {
  flake.nixosModules.user-session = {...}: {
    home-manager.sharedModules = [
      {
        home.sessionVariables = {
          EDITOR = "nvim";
          VISUAL = "nvim";
          BROWSER = "firefox";
          GDK_BACKEND = "wayland";
          QT_QPA_PLATFORM = "wayland";
          MOZ_ENABLE_WAYLAND = "1";
        };
      }
    ];
  };
}
