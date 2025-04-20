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
          "emerald" = { id = "INKFIAW-55AWZP4-WSXYO7Z-YU2GBBU-QHYZMOD-YEZOHAI-N7V7UFT-NYG4RQC"; };
        };

        folders = {
          "Obsidian" = {
            id = "obsidian-vaults-current";
            path = "/mnt/Vaults/Current";
            devices = ["Bismuth" "emerald"];
          };
        };
      };
    };
  };
  
  home-manager.users.emily.wayland.windowManager.hyprland.settings = {
    monitor = [ ",highres@highrr,auto,1"];
  #   xwayland = {
  #     force_zero_scaling = true;
  #   };
  #   env = [
  #     "GDK_SCALE,2"
  #   ];
  };
}
