{ ... }: {
  flake.nixosModules.openssh = { ... }: {
    services.openssh = {
      enable = true;
      ports = [ 22 ];
      settings = {
        PermitRootLogin = "no";
        KbdInteractiveAuthentication = false;
        LogLevel = "VERBOSE";
        PasswordAuthentication = false;
      };
    };

    services.fail2ban.jails = {
      apache-nohome-iptables = {
        settings = {
          # Block an IP address if it accesses a non-existent
          # home directory more than 5 times in 10 minutes,
          filter = "apache-nohome";
          action = ''iptables-multiport[name=HTTP, port="http,https"]'';
          logpath = "/var/log/httpd/error_log*";
          backend = "auto";
          findtime = 600;
          bantime = 600;
          maxretry = 5;
        };
      };
      dovecot = {
        settings = {
          # block IPs which failed to log-in
          # aggressive mode add blocking for aborted connections
          filter = "dovecot[mode=aggressive]";
          maxretry = 3;
        };
      };
    };
  };
}
