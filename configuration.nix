# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }:

{
  # imports =
  #   [ # Include the results of the hardware scan.
  #     ./hardware-configuration.nix
  #   ];

  #nix.settings.experimental-features = ["nix-command" "flakes"];

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    #substituters = ["https://hyprland.cachix.org"];
    #trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "Emerald"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  #services.pipewire.extraConfig.pipewire."92-low-latency" = {
  #  "context.properties" = {
      #"default.clock.rate" = 48000;
      #"default.clock.quantum" = 2048;
  #    "default.clock.min-quantum" = 1024;
      #"default.clock.max-quantum" = 2048;
  #  };
  #};

#  services.pipewire.extraConfig.pipewire-pulse."92-low-latency" = {
#    context.modules = [
#    {
#      name = "libpipewire-module-protocol-pulse";
#      args = {
#        pulse.min.req = "768/48000";
#        pulse.default.req = "768/48000";
#        pulse.max.req = "768/48000";
#        pulse.min.quantum = "768/48000";
#        pulse.max.quantum = "768/48000";
#      };
#    }
#    ];
#    stream.properties = {
#      node.latency = "768/48000";
#      resample.quality = 1;
#    };
#  };

  # Containers
  virtualisation = {

    # Docker
    docker = {
      enable = true;
      liveRestore = false;

      daemon.settings = {
        data-root = "/docker";
      };

      # rootless = {
      #  enable = true;
      # setSocketVariable = true;
      #};

    };
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.emily = {
    isNormalUser = true;
    description = "Emily";
    extraGroups = [ "networkmanager" "wheel" "docker"];
    packages = with pkgs; [
      kdePackages.kate
      keepassxc
      #obsidian
      #vesktop
      #neofetch
    #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    wget
    #neovim # We explicitly install and configure neovim system-wide below
    bat
    btop
    htop
    ranger
    unzip
    tmux
    dua
    swayfx
    wofi
    just
    kitty
    p7zip
  #  wget
  ];


  environment.shellAliases = {
    nv = "nvim";
  };

  programs.neovim = {
    enable = true;
    configure = {
      customRC = ''
        nnoremap ; :
        set number
        set relativenumber
        set expandtab
        set shiftwidth=2
    '';
    };
    viAlias = true;
    vimAlias = true;
    defaultEditor =  true;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

#  hardware.opengl = {
#    enable = true;
#  };

  hardware.graphics = {
    enable = true;
  };


  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  boot.supportedFilesystems = [ "ntfs" ];

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

  # hyprland
  programs.hyprland.enable = true;

  # feesh
  programs.fish.enable = true;

  users.defaultUserShell = pkgs.fish;

  virtualisation.oci-containers.containers = {
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

    #"freshrss" = {
    #  autoStart = true;
    #  image = "";
    #  ports = [];
    #  volumes = [
    #  ];
    #};

    
  };


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  #networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  i18n = {
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-mozc
        fcitx5-gtk
        catppuccin-fcitx5
      ];
    };
  };


}
