let
  topBar = "{##FEFFE4}╭┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄";
  bar = "{##FEFFE4}┊ ";
  underBar = "{##FEFFE4}╰┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄╯";
  outColor = "#E3F2FF";
  softwareColor = "#A2F7A1";
  hardwareColor = "#8BBBF4";
  ageColor = "#E64C7E";
in
{ ... }: {
  flake.homeModules.fastfetch = { pkgs, ... }: {
    programs.fastfetch = {
      enable = true;
      package = pkgs.fastfetch;
      settings = {
        logo = {
          type = "builtin";
          source = "nixos";
          height = 10;
          width = 16;
          padding = {
            top = 2;
            right = 2;
            left = 2;
          };
        };
        display = {
          size = {
            binaryPrefix = "iec";
          };
          color = "white";
          separator = "⦂ ";
        };
        modules = [
          {
            type = "title";
            color = {
              user = "#CF3F62";
              at = "#FEFFE4";
              host = "#7DF0C8";
            };
            format = "${topBar}{user-name-colored}{at-symbol-colored}{host-name-colored}";
          }
          {
            type = "custom";
            format = "${bar}{#${softwareColor}}╭┄⦤Software⦥";
          }
          {
            type = "os";
            key = "${bar}{#${softwareColor}}├┄ ";
            keyColor = "${softwareColor}";
            outputColor = "${outColor}";
            format = "{name} {version}";
          }
          {
            type = "kernel";
            key = "${bar}{#${softwareColor}}├┄󰌽 ";
            keyColor = "${softwareColor}";
            outputColor = "#E3F2FF";
          }
          {
            type = "packages";
            key = "${bar}{#${softwareColor}}├┄ ";
            format = "{nix-system} (system)";
            keyColor = "${softwareColor}";
            outputColor = "${outColor}";
          }
          {
            type = "packages";
            key = "${bar}{#${softwareColor}}├┄󰏗 ";
            format = "{nix-user} (user)";
            keyColor = "${softwareColor}";
            outputColor = "${outColor}";
          }
          {
            type = "shell";
            key = "${bar}{#${softwareColor}}├┄󰞷 ";
            keyColor = "${softwareColor}";
            outputColor = "${outColor}";
          }
          {
            type = "wm";
            key = "${bar}{#${softwareColor}}├┄󱂬 ";
            keyColor = "${softwareColor}";
            outputColor = "${outColor}";
          }
          {
            type = "terminal";
            key = "${bar}{#${softwareColor}}╰┄ ";
            keyColor = "${softwareColor}";
            outputColor = "${outColor}";
          }
          {
            type = "custom";
            format = "${bar}";
          }
          {
            type = "custom";
            format = "${bar}{#${hardwareColor}}╭┄⦤Hardware⦥";
          }
          {
            type = "cpu";
            key = "${bar}{#${hardwareColor}}├┄󰻠 ";
            keyColor = "${hardwareColor}";
            outputColor = "${outColor}";

          }
          {
            type = "gpu";
            key = "${bar}{#${hardwareColor}}├┄󰍹 ";
            keyColor = "${hardwareColor}";
            outputColor = "${outColor}";
          }
          {
            type = "memory";
            key = "${bar}{#${hardwareColor}}├┄󰑭 ";
            keyColor = "${hardwareColor}";
            outputColor = "${outColor}";
          }
          {
            type = "disk";
            key = "${bar}{#${hardwareColor}}╰┄󰋊 ";
            keyColor = "${hardwareColor}";
            outputColor = "${outColor}";
          }
          {
            type = "custom";
            format = "${bar}";
          }
          {
            type = "custom";
            format = "${bar}{#${ageColor}}╭┄⦤Age⦥";
          }
          {
            type = "disk";
            key = "${bar}{#${ageColor}}├┄󰔠 ";
            keyColor = "${ageColor}";
            outputColor = "${outColor}";
            folders = "/";
            format = "{days} days";
          }
          {
            type = "uptime";
            key = "${bar}{#${ageColor}}├┄󱫠 ";
            keyColor = "${ageColor}";
            outputColor = "${outColor}";
          }
          {
            type = "datetime";
            key = "${bar}{#${ageColor}}╰┄ ";
            keyColor = "${ageColor}";
            outputColor = "${outColor}";
          }
          {
            type = "custom";
            format = "${bar}";
          }
          {
            type = "colors";
            key = "${bar}{##FEFFE4}╶┄󰏘 ";
            keyColor = "#FEFFE4";
            padding = {
              left = 2;
            };
            symbol = "circle";
          }
          {
            type = "custom";
            format = "${underBar}";
          }
        ];
      };
    };
  };
}
