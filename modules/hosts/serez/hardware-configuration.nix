{ ... }: {
  flake.nixosModules.serezHardware =
    {
      config,
      lib,
      modulesPath,
      ...
    }:
    {
      imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
      ];

      boot = {
        initrd = {
          availableKernelModules = [
            "nvme"
            "xhci_pci"
            "ahci"
            "usb_storage"
            "usbhid"
            "sd_mod"
          ];
          kernelModules = [ ];
          luks.devices."main".device = "/dev/disk/by-uuid/cc635417-f518-4862-b3bd-fccad35e308d";
        };
        kernelModules = [ "kvm-amd" ];
        extraModulePackages = [ ];
      };

      fileSystems = {
        "/" = {
          device = "/dev/mapper/main";
          fsType = "btrfs";
          options = [
            "subvol=@"
            "compress=zstd"
            "noatime"
          ];
        };

        "/home" = {
          device = "/dev/mapper/main";
          fsType = "btrfs";
          options = [
            "subvol=@home"
            "compress=zstd"
            "noatime"
          ];
        };

        "/var/log" = {
          device = "/dev/mapper/main";
          fsType = "btrfs";
          options = [
            "subvol=@log"
            "compress=zstd"
            "noatime"
          ];
        };

        "/var/cache" = {
          device = "/dev/mapper/main";
          fsType = "btrfs";
          options = [
            "subvol=@cache"
            "compress=zstd"
            "noatime"
          ];
        };

        "/boot" = {
          device = "/dev/disk/by-uuid/F05A-B396";
          fsType = "vfat";
          options = [
            "fmask=0022"
            "dmask=0022"
          ];
        };
      };

      swapDevices = [ ];

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
}
