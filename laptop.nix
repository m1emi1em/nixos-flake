{config, lib, pkgs, ...}:
{
  networking = {
    hostName = "quartz";
  };

  services = {
    automatic-timezoned.enable = true;
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
  
  home-manager.users.emily.wayland.windowManager = {
    hyprland = {
      settings = {
        monitor = [ ",highres@highrr,auto,1.5"];
        # env = [
        #   "AQ_DRM_DEVICES,/dev/dri/card2:/dev/dri/card1"
        # ];
        xwayland = {
          force_zero_scaling = true;
        };
        env = [
          "GDK_SCALE,1.5"
          "XCURSOR_SIZE,32"
        ];
      };
    };
  };
  home-manager.users.emily = {
    programs = {
      hyprpanel = {
        settings = {
          bar.layouts = {
            "0" = {
              left = [ "dashboard" "workspaces" ];
              middle = [ "windowtitle" ];
              right = [  "systray" "network" "weather" "volume" "battery" "clock" "notifications"];
            };
          };
        };
      };
    };
  };
}
