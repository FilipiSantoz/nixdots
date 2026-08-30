{inputs, ...}: {
  flake.nixosModules.compositor = {
    pkgs,
    config,
    ...
  }: {
    imports = [inputs.niri-flake.nixosModules.niri];

    programs.niri = {
      enable = true;
      package = pkgs.niri;
    };
    niri-flake.cache.enable = true;
    security.polkit.enable = true;

    services.greetd = {
      enable = true;
      settings.default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd ${config.programs.niri.package}/bin/niri-session";
        user = "greeter";
      };
    };
    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = [pkgs.xdg-desktop-portal-gtk];
      config = {
        niri.default = ["gtk"];
        common.default = ["gtk"];
      };
    };
    environment.systemPackages = with pkgs; [vulkan-tools radeontop];
  };
}
