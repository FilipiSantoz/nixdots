{ inputs, ... }: {
  flake.homeModules.user-packages = { pkgs, ... }: {
    home.packages = with pkgs; [
      inputs.Neve.packages.${pkgs.stdenv.hostPlatform.system}.default
      inputs.antigravity-nix.packages.${pkgs.stdenv.hostPlatform.system}.google-antigravity
      inputs.antigravity-nix.packages.${pkgs.stdenv.hostPlatform.system}.google-antigravity-cli
      inputs.herdr.packages.${pkgs.stdenv.hostPlatform.system}.default
      bibata-cursors
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
      coreutils
      gnumake
      hextazy
      rocmPackages.rocm-smi
      btop-rocm
      tree-sitter
      glib
      foliate
      miro
      gnome-calculator
      crosspipe
      pavucontrol
      ffmpeg
      nix-index
      wlr-randr

      statix
      alejandra
      nixd
    ];
  };
}
