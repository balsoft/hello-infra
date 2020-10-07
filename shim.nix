{
  boot.loader.systemd-boot.enable = true;

  fileSystems."/" = {
    device = "/dev/sdZ0";
    fsType = "btrfs";
  };
}
