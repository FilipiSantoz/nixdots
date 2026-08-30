{
  self,
  input,
  ...
}: {
  flake.nixosModules.core = {
    pkgs,
    lib,
    ...
  }: {
    boot.loader = {
      timeout = 15;

      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot";
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
        splashImage = ./images/x.png;
      };
    };
    boot.initrd.luks.devices."main".device = "/dev/disk/by-uuid/cc635417-f518-4862-b3bd-fccad35e308d";
    boot.kernelPackages = pkgs.linuxPackages_latest;

    networking.hostName = "lua";
    networking.networkmanager.enable = true;
    networking.firewall = {
      enable = true;
      allowedTCPPorts = [22];
      trustedInterfaces = ["dcoker0"];
    };
    services.power-profiles-daemon.enable = true;

    time.timeZone = "America/Sao_Paulo";
    i18n.defaultLocale = "pt_BR.UTF-8";
    i18n.extraLocaleSettings = {
      LC_MESSAGES = "en_US.UTF-8";
      LC_IDENTIFICATION = "pt_BR.UTF-8";
      LC_MEASUREMENT = "pt_BR.UTF-8";
      LC_MONETARY = "pt_BR.UTF-8";
      LC_NAME = "pt_BR.UTF-8";
      LC_NUMERIC = "pt_BR.UTF-8";
      LC_PAPER = "pt_BR.UTF-8";
      LC_TELEPHONE = "pt_BR.UTF-8";
      LC_TIME = "pt_BR.UTF-8";
    };
    console.keyMap = "br-abnt2";

    nix.settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
      extra-substituters = ["https://noctalia.cachix.org"];
      extra-trusted-public-keys = [
        "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      ];
    };
    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    zramSwap.enable = true;
    services.fstrim.enable = true;
    services.btrfs.autoScrub = {
      enable = true;
      interval = "monthly";
      fileSystems = ["/"];
    };

    environment.systemPackages = with pkgs; [neovim git curl bat jq wget unzip];

    system.stateVersion = "26.05";
  };
}
