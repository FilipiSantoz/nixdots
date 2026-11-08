{...}: {
  flake.homeModules.yazi = {pkgs, ...}: {
    programs.yazi = {
      enable = true;
      enableZshIntegration = true;
      plugins = {
        inherit (pkgs.yaziPlugins) mediainfo;
      };
      settings = {
        mgr = {
          show_hidden = true;
          sort_by = "btime";
          sort_dir_first = true;
          sort_reverse = false;
          mouse_events = ["click" "drag"];
        };
        plugin.prepend_previewers = [
          {
            mime = "{image,audio,video}/*";
            run = "mediainfo";
          }
          {
            mime = "application/x-subrip";
            run = "mediainfo";
          }
        ];
      };
      keymap = {
        mgr.prepend_keymap = [
          {
            on = ["<A-d>"];
            run = "shell -- ripdrag --target --keep --no-click --and-exit --icon-size 64 %s | while read filepath; do cp -nR \"$filepath\" .; done";
            desc = "Arrastar arquivos para fora e copiar para dentro";
          }
          {
            on = ["<A-D>"];
            run = "shell -- ripdrag --target --keep --no-click --and-exit --icon-size 64 %s | while read filepath; do cp -fR \"$filepath\" .; done";
            desc = "Arrastar arquivos (sobrescrevendo existentes)";
          }
        ];
      };
    };
    home.packages = with pkgs; [
      mediainfo
      ffmpegthumbnailer
      ripdrag
    ];
  };
}
