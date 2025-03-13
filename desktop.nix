{config, lib, pkgs, home-manager, ...}:
{
  # imports = [
  #   ./hw-confs/desktop.nix
  # ];

  # imports = [
  #   ./filesystems.nix
  #   ./virt.nix
  # ];

  boot = {
    supportedFilesystems = ["zfs"];
    zfs.forceImportRoot = false;
  };

  networking = {
    hostName = "emerald";
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

  home-manager.users.emily.wayland.windowManager.hyprland.settings.monitor =
    [ "DP-2, 1920x1080@144, 0x0, 1" "DP-3, 1920x1080@144, auto, 1, transform, 3"];
}
