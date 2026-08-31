{...}: {
  flake.nixosModules.fzf = {...}: {
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
      defaultOptions = ["--height 40%" "--border"];
    };
  };
}
