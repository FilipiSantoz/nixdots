{ ... }: {
  flake.nixosModules.user-dir = { ... }: {
    home-manager.sharedModules = [
      {
        xdg.userDirs = {
          enable = true;
          createDirectories = true;
          desktop = "$HOME/Desktop";
          documents = "$HOME/Documents";
          download = "$HOME/Downloads";
          music = "$HOME/Music";
          pictures = "$HOME/Pictures";
          videos = "$HOME/Videos";
          templates = "$HOME/Templates";
          publicShare = "$HOME/Public";
        };

        programs.direnv = {
          enable = true;
          nix-direnv.enable = true;
          enableZshIntegration = true;
        };
      }
    ];
  };
}
