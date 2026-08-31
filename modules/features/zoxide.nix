{...}: {
  flake.homeManagerModules.zoxide = {...}: {
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
