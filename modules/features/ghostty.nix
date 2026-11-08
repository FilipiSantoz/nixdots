{ ... }: {

  flake.homeModules.ghostty = { ... }: {

    programs.ghostty = {
      enable = true;
      enableZshIntegration = true;
      installVimSyntax = true;
      settings = {
        window-padding-x = 0;
        window-padding-y = 0;
        "shell-integration-features" = "no-cursor";
        theme = "Duskfox";
        font-size = 12;
        foreground = "#e3f2ff";
        cursor-color = "#e3f2ff";
        background = "#120F17";
        palette = [
          "1=#cf3f62"
          "2=#94e871"
          "4=#769bdb"
          "5=#c87df0"
          "6=#94eaf7"
          "9=#e64c7e"
          "10=#a2f7a1"
          "12=#8bbbf4"
          "13=#fa92d6"

        ];

        font-family = "DepartureMono Nerd Font";
        background-opacity = 0.90;
        background-blur = true;
        title = "Ghostty";
        window-decoration = "none";
        "window-inherit-working-directory" = false;
        "working-directory" = "home";
        "window-padding-balance" = false;
        "window-padding-color" = "extend-always";

        cursor-style = "block";
        cursor-style-blink = true;
        "custom-shader-animation" = "always";
        "custom-shader" = [
          "shaders/cursor_tail.glsl"
        ];

      };
    };
  };
}
