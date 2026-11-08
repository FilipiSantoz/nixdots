{ ... }: {
  flake.nixosModules.openssh = { ... }: {
    services.openssh = {
      enable = true;
      ports = [ 22 ];
      settings = {
        PermitRootLogin = "no";
        KbdInteractiveAuthentication = false;
        LogLevel = "INFO";
        PasswordAuthentication = false;
      };
    };

    services.fail2ban.enable = true;
  };
}
