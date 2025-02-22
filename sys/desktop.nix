{config, lib, pkgs, ...}:
{
  # imports = [
  #   ./hw-confs/desktop.nix
  # ];

  imports = [
    ./filesystems.nix
    ./virt.nix
  ];

  boot = {
    supportedFilesystems = ["zfs"];
    zfs.forceImportRoot = false;
  };

  networking = {
    hostName = "Emerald";
    # networkmanager.enable = true;
    hostId = "7210d2a7";
  };


  services = {
    syncthing = {
      settings = {
        folders = {
          "Obsidian" = {
            id = "obsidian-vaults-current";
            path = "/mnt/BiggusDiskus/Vaults/Current";
            devices = ["Bismuth"];
          };
        };
      };
    };
  };
}
