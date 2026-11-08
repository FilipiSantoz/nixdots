{...}: {
  flake.homeModules.tmux = {pkgs, ...}: {
    programs.tmux = {
      enable = true;

      shortcut = "a";
      baseIndex = 1;
      escapeTime = 0;
      mouse = true;
      terminal = "tmux-256color";
      historyLimit = 100000;

      plugins = with pkgs.tmuxPlugins; [
        sensible
        resurrect
        {
          plugin = catppuccin;
          extraConfig = ''
            set -g @catppuccin_flavor "macchiato"
            set -g @catppuccin_window_status_style "rounded"
          '';
        }
      ];

      extraConfig = ''
        bind r source-file ~/.config/tmux/tmux.conf \; display "Configuração recarregada!"

        bind i split-window -h -c "#{pane_current_path}"
        bind u split-window -v -c "#{pane_current_path}"
        bind c new-window -c "#{pane_current_path}"

        bind h select-pane -L
        bind j select-pane -D
        bind k select-pane -U
        bind l select-pane -R

        bind -r H resize-pane -L 5
        bind -r J resize-pane -D 5
        bind -r K resize-pane -U 5
        bind -r L resize-pane -R 5

      '';
    };
  };
}
