{...}: {
  flake.homeManagerModules.user-session = {...}: {
    home.sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      BROWSER = "zen-beta";
      GDK_BACKEND = "wayland";
      QT_QPA_PLATFORM = "wayland";
      MOZ_ENABLE_WAYLAND = "1";
    };
  };
}
