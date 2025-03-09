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
        devices = {
          "quartz" = { id = "EJ7G7LI-7XLJ6PB-AID7I75-WQ2PYAY-V42GMIN-GYBSLDS-BRIETL7-4CFLSQ7"; };
        };
        
        folders = {
          "Obsidian" = {
            id = "obsidian-vaults-current";
            path = "/mnt/BiggusDiskus/Vaults/Current";
            devices = ["Bismuth" "quartz"];
          };
        };
      };
    };
  };
}
