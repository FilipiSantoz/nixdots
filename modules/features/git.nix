{ lib, ... }: {
  flake.homeModules.git = { ... }: {
    programs.git = {
      enable = true;
      settings = {
        init.defaultBranch = lib.mkDefault "main";
        core.editor = lib.mkDefault "nvim";
        pull.rebase = lib.mkDefault false;
        gpg.format = lib.mkDefault "ssh";
      };
    };
  };
}
