{...}: {
  flake.nixosModules.user-packages = {pkgs, ...}: {
    home-manager.sharedModules = [
      {
        home.packages = with pkgs; [
          # Normal Stack
          ripgrep
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
          hextazy
          rocmPackages.rocm-smi
          btop-rocm
        ];
      }
    ];
  };
}
