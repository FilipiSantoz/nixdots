{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.niri = {pkgs, ...}: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.lunaNiri;
    };
  };
  perSystem = {
    pkgs,
    lib,
    self',
    ...
  }: {
    packages.lunaNiri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;
      settings = {
        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;
        # bibata-cursors.path = lib.getExe pkgs.bibata-cursors;
        input = {
          keyboard = {
            xkb = {
              layout = "br";
              variant = "abnt2";
            };
            numlock = _: {}; # <- translated to nothing
          };
          touchpad = {
            tap = _: {};
            natural-scroll = _: {};
          };
        };
        environment = {
          NIXOS_OZONE_WL = "1";
          MOZ_ENABLE_WAYLAND = "1";
          QT_QPA_PLATFORM = "wayland";
          GDK_BACKEND = "wayland";
        };
        binds = {
          "Mod+Return".spawn-sh = lib.getExe pkgs.kitty;
          "Mod+W".close-window = _: {};
          "Mod+N".spawn-sh = "${lib.getExe pkgs.kitty} nvim";
          "Mod+B".spawn-sh = "zen-beta";
          "Mod+X".spawn-sh = "audacious";
          "Mod+Shift+E".quit = _: {};
          "Mod+Y".spawn-sh = "${lib.getExe pkgs.kitty} yazi";

          # === LAYOUT CONTROLS ===
          "Mod+R".switch-preset-column-width = _: {};
          "Mod+Shift+R".switch-preset-column-width-back = _: {};
          "Mod+T".switch-preset-window-height = _: {};
          "Mod+Shift+T".switch-preset-window-height-back = _: {};
          "Mod+F".maximize-column = _: {};
          "Mod+Shift+F".fullscreen-window = _: {};
          "Mod+M".maximize-window-to-edges = _: {};
          "Mod+O".toggle-overview = _: {};

          # === Change Workspaces ===
          "Mod+1".focus-workspace = 1;
          "Mod+2".focus-workspace = 2;
          "Mod+3".focus-workspace = 3;
          "Mod+4".focus-workspace = 4;
          "Mod+5".focus-workspace = 5;
          "Mod+6".focus-workspace = 6;
          "Mod+7".focus-workspace = 7;
          "Mod+8".focus-workspace = 8;
          "Mod+9".focus-workspace = 9;

          # === Window Move ===
          "Mod+left".focus-column-left = _: {};
          "Mod+Right".focus-column-right = _: {};
          "Mod+Up".focus-window-up = _: {};
          "Mod+Down".focus-window-down = _: {};
          "Mod+H".focus-column-left = _: {};
          "Mod+L".focus-column-right = _: {};
          "Mod+K".focus-window-up = _: {};
          "Mod+J".focus-window-down = _: {};
          "Mod+Shift+WheelScrollDown".focus-column-right = _: {};
          "Mod+Shift+WheelScrollUp".focus-column-left = _: {};

          # === Change Window  ===
          "Mod+Ctrl+left".move-column-left = _: {};
          "Mod+Ctrl+Right".move-column-right = _: {};
          "Mod+Ctrl+Up".move-window-up = _: {};
          "Mod+Ctrl+Down".move-window-down = _: {};
          "Mod+Ctrl+L".move-column-left = _: {};
          "Mod+Ctrl+H".move-column-right = _: {};
          "Mod+Ctrl+K".move-window-up = _: {};
          "Mod+Ctrl+J".move-window-down = _: {};

          # === Move To Workspaces ===
          "Mod+Ctrl+1".move-column-to-workspace = 1;
          "Mod+Ctrl+2".move-column-to-workspace = 2;
          "Mod+Ctrl+3".move-column-to-workspace = 3;
          "Mod+Ctrl+4".move-column-to-workspace = 4;
          "Mod+Ctrl+5".move-column-to-workspace = 5;
          "Mod+Ctrl+6".move-column-to-workspace = 6;
          "Mod+Ctrl+7".move-column-to-workspace = 7;
          "Mod+Ctrl+8".move-column-to-workspace = 8;
          "Mod+Ctrl+9".move-column-to-workspace = 9;

          # === Scroll Vertical ===
          "Mod+WheelScrollDown".focus-workspace-down = _: {};
          "Mod+WheelScrollUp".focus-workspace-up = _: {};
          "Mod+Ctrl+WheelScrollDown".move-column-to-workspace-down = _: {};
          "Mod+Ctrl+WheelScrollUp".move-column-to-workspace-up = _: {};

          # === Noctalia Integration ===
          "Mod+Shift+S".spawn = ["noctalia" "msg" "screenshot-region" "wlr-screencopy"];
          "Mod+Space".spawn = ["noctalia" "msg" "panel-toggle" "launcher"];
          "Mod+S".spawn = ["noctalia" "msg" "panel-toggle" "control-center"];
          "Mod+C".spawn = ["noctalia" "msg" "settings-toggle"];
          "Mod+Escape".spawn = ["noctalia" "msg" "panel-toggle" "session"];
          "XF86AudioRaiseVolume".spawn = ["noctalia" "msg" "volume-up"];
          "XF86AudioLowerVolume".spawn = ["noctalia" "msg" "volume-down"];
          "XF86AudioMute".spawn = ["noctalia" "msg" "volume-mute"];
          "XF86AudioMicMute".spawn = ["noctalia" "msg" "mic-mute"];

          # === Media Controls ===
          "XF86AudioPlay".spawn = ["playerctl" "play-pause"];
          "XF86AudioStop".spawn = ["playerctl" "stop"];
          "XF86AudioPrev".spawn = ["playerctl" "previous"];
          "XF86AudioNext".spawn = ["playerctl" "next"];
        };

        layout = {
          gaps = 10;
          background-color = "transparent";

          focus-ring = {
            on = _: {};
            width = 2;
            active-color = "#BB99E8";
          };

          shadow = {
            on = _: {};
            color = "#00000070";
            softness = 22;
            spread = 8;
          };
          preset-column-widths = [
            {proportion = 0.333333;}
            {proportion = 0.500000;}
            {proportion = 0.666667;}
            {proportion = 1.000000;}
          ];

          preset-window-heights = [
            {proportion = 0.333333;}
            {proportion = 0.500000;}
            {proportion = 0.666667;}
            {proportion = 1.000000;}
          ];

          default-column-width = {
            proportion = 0.5;
          };
        };
        window-rules = [
          {
            clip-to-geometry = true;
            geometry-corner-radius = 12;
          }
          {
            matches = [{app-id = "^kitty";}];
            draw-border-with-background = false;
          }
          {
            matches = [
              {app-id = "^firefox";}
            ];
            open-maximized = true;
          }
        ];
        layer-rules = [
          {
            matches = [{namespace = "^noctalia-backdrop";}];
            place-within-backdrop = true;
          }
        ];
        cursor = {
          xcursor-size = 24;
          xcursor-theme = "Bibata-Modern-Ice";
        };
        hotkey-overlay = {
          skip-at-startup = _: {};
        };
      };
    };
  };
}
