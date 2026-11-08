{ ... }: {
  flake.homeModules.user-session = { ... }: {
    home.sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      BROWSER = "zen-beta";
      GDK_BACKEND = "wayland";
      QT_QPA_PLATFORM = "wayland";
      GTK_IM_MODULE = "simple";
      MOZ_ENABLE_WAYLAND = "1";
    };
  };
}
