{ inputs, ... }: {
  flake.nixosModules.user-packages = { pkgs, ... }: {
    home-manager.sharedModules = [
      {
        home.packages = with pkgs; [
          # Normal Stack
          inputs.Neve.packages.${pkgs.stdenv.hostPlatform.system}.default
          playerctl
          lazygit
          wl-clipboard
          lm_sensors
          fastfetch
          opencode
          audacious
          chromium
          vlc
          pi-coding-agent
          shotcut
          gcc
          gnumake
          hextazy
          rocmPackages.rocm-smi
          btop-rocm
          tree-sitter
          glib
          foliate
          miro
          gnome-calculator
        ];
      }
    ];
  };
}
