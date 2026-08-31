{...}: {
  flake.homeManagerModules.zsh = {...}: {
    programs.zsh = {
      enable = true;
      autocd = true;
      enableCompletion = true;
      autosuggestion = {
        enable = true;
        strategy = ["history"];
      };
      syntaxHighlighting.enable = true;
      history = {
        size = 10000;
        save = 10000;
        share = true;
        append = true;
        ignoreDups = true;
      };
      # EZA Aliases
      shellAliases = {
        vim = "nvim";
        ls = "eza --icons --group-directories-first";
        ll = "eza -lh --icons --group-directories-first";
        la = "eza -a --icons --group-directories-first";
        lt = "eza --tree --icons";
        lla = "eza -lah --icons --group-directories-first";
        nixrebuild = "sudo nixos-rebuild switch --flake ~/luaNix/nix#lua";
      };

      initContent = ''

        # --- Load Modules ---
        zmodload zsh/complist
        autoload -U colors && colors

        # --- Yazi Wrapper ---
        function y() {
           local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
           command yazi "$@" --cwd-file="$tmp"
           IFS= read -r -d ''' cwd < "$tmp"
           [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
           command rm -f -- "$tmp"
        }

        # --- Completion Opts ---
        zstyle ':completion:*' menu select
      '';
    };
  };
}
