{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.lunaHardware = {
    config,
    lib,
    modulesPath,
    ...
  }: {
    imports = [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

    boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod"];
    boot.initrd.kernelModules = [];
    boot.kernelModules = ["kvm-amd"];
    boot.extraModulePackages = [];

    fileSystems."/" = {
      device = "/dev/mapper/main";
      fsType = "btrfs";
      options = ["subvol=@"];
    };

    boot.initrd.luks.devices."main".device = "/dev/disk/by-uuid/cc635417-f518-4862-b3bd-fccad35e308d";

    fileSystems."/home" = {
      device = "/dev/mapper/main";
      fsType = "btrfs";
      options = ["subvol=@home"];
    };

    fileSystems."/var/log" = {
      device = "/dev/mapper/main";
      fsType = "btrfs";
      options = ["subvol=@log"];
    };

    fileSystems."/var/cache" = {
      device = "/dev/mapper/main";
      fsType = "btrfs";
      options = ["subvol=@cache"];
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/F05A-B396";
      fsType = "vfat";
      options = ["fmask=0022" "dmask=0022"];
    };

    swapDevices = [];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
