{ self, lib, ... }: {
  flake.nixosModules.compositor = { pkgs, ... }: {
    security.polkit.enable = true;

    services.greetd = {
      enable = true;
      settings.default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd ${
          self.packages.${pkgs.stdenv.hostPlatform.system}.serezNiri
        }/bin/niri-session";
        user = "greeter";
      };
    };

    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      config = {
        niri.default = lib.mkForce [ "gtk" ];
        common.default = [ "gtk" ];
      };
    };

    environment.systemPackages = with pkgs; [
      vulkan-tools
      radeontop
    ];
  };
}
