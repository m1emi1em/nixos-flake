{config, lib, pkgs, home-manager, ...}:
{
  # imports = [
  #   ./hw-confs/desktop.nix
  # ];

  # imports = [
  #   ./filesystems.nix
  #   ./virt.nix
  # ];

  # boot = {
  #   supportedFilesystems = ["zfs"];
  #   zfs.forceImportRoot = false;
  # };

  time.timeZone = "America/New_York";

  # There's no need to do it this way for now
  # But it works so that's neat I guess
  networking.hostId = lib.mkIf (config.networking.hostName == "emerald") "7210d2a7"; 

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

  fileSystems."/mnt/BiggusDiskus" = {
    device = "/dev/nvme0n1p2";
    fsType = "ntfs-3g";
    options = [
      "users" 
      "nofail"
      "rw"
      "exec"
    ];
  };
  virtualisation = {
    docker = {
      enable = true;
      liveRestore = false;
      daemon.settings = {
        data-root = "/docker";
      };
    };
    
    # Could/should probs make these their own modules too tbh
    oci-containers.containers = {
      "gitea" = {
        autoStart = true;
        image = "gitea/gitea";
        ports = [ "32769:22" "32768:3000"];
        environment = {
          #USER_UID = "1000";
          #USER_GID = "1000";
          USER = "git";
          GITEA_CUSTOM = "/data/gitea";
        };
        volumes = [
          "/home/volumes/gitea/data:/data"
          "/etc/timezone:/etc/timezone:ro"
          "/etc/localtime:/etc/localtime:ro"
        ];
      };
    };
  };

  home-manager.users.emily.wayland.windowManager.hyprland.settings = {
    workspace = [
      "1, monitor:DP-2, default:true"
      "2, monitor:DP-2"
      "3, monitor:DP-2"
      "4, monitor:DP-2"
      "5, monitor:DP-2"
      "6, monitor:DP-3"
      "7, monitor:DP-3"
      "8, monitor:DP-3"
      "9, monitor:DP-3"
      "10, monitor:DP-3"
    ];

    monitor = [ "DP-2, 1920x1080@144, 0x0, 1" "DP-3, 1920x1080@144, auto, 1, transform, 3"];

    windowrulev2 = let
      mkRules = matcher: rules:
        map (rule: "${rule},${matcher}") rules;
      mkClassRules = windowClass: rules:
        mkRules "class:^(${windowClass})$" rules;
      mkOsuRules = rules:
        mkClassRules "osu!" rules;
    in
      (mkOsuRules [
        "float"
        "size 1366 768"
        "monitor DP-2"
        "workspace 2"
        "move 100%-w-5 50"
      ]);
  };
  home-manager.users.emily = {
    programs = {
      hyprpanel = {
        settings = {
          "bar.layouts" = {
            "0" = {
              left = [ "dashboard" "workspaces" "media"];
              middle = [ "windowtitle" ];
              right = [  "systray" "network" "weather" "volume" "clock" "notifications"];
            };
            "1" = {
              left = ["workspaces"];
              middle = ["windowtitle"];
              right = ["clock"];
            };
          };
        };
      };
    };
  };
}
