{config, lib, pkgs, ...}:
{
  networking = {
    hostName = "quartz";
  };

  services = {
    supergfxd.enable = true;

    asusd = {
      enable = true;
      enableUserService = true;
    };
    
    syncthing = {
      settings = {
        devices = {
          "Emerald" = { id = "INKFIAW-55AWZP4-WSXYO7Z-YU2GBBU-QHYZMOD-YEZOHAI-N7V7UFT-NYG4RQC"; };
        };

        folders = {
          "Obsidian" = {
            id = "obsidian-vaults-current";
            path = "/mnt/Vaults/Current";
            devices = ["Bismuth" "Emerald"];
          };
        };
      };
    };
  };
}
