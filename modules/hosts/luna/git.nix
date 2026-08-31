{...}: {
  flake.homeManagerModules.user-git = {...}: {
    programs.git = {
      enable = true;
      settings = {
        user.name = "FilipiSantoz";
        user.email = "239681201+FilipiSantoz@users.noreply.github.com";
        init.defaultBranch = "main";
        core.editor = "nvim";
        pull.rebase = false;
        gpg.format = "ssh";
      };
    };
  };
}
