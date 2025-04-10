{config, pkgs, inputs, ...}:
let 
  unstablePackages = with pkgs; [
    hyfetch # gui
    emacs # gui, wsl, server?
    #steam
    mpv # gui
    discord # gui
    vesktop # gui
    keepassxc # gui
    prismlauncher # gui
    signal-desktop # gui
    duf # util
    ncmpcpp # gui



    mpris-timer # gui


    irssi # gui, wsl
    flameshot # gui
    ungoogled-chromium # gui

    anki # gui
    qbittorrent # gui, server?
    picard # server

    spotify # gui
    zoom-us # gui

    obsidian # gui
    alacritty # gui
    lutris # gui
    pfetch # util
    ghostty
    yazi # util
    godot_4 # gui
    aseprite # gui
    yt-dlp # util
    reaper # gui

    charm-freeze # util

    gamescope # gui
    mangohud  # gui


    piper # gui
    # libratbag # gui

    libnotify # gui

    pandoc
    texlive.combined.scheme-full

    osu-lazer-bin
  ];
in
{
  home.username = "emily";
  home.homeDirectory = "/home/emily";

  # Stable packages
  home.packages = unstablePackages;

  imports = [
    ./home/emily/gui/hyprland
  ];

  # nixpkgs.config.packageOverrides = pkgs: {
  #   steam = pkgs.steam.override {
  #     extraPkgs = pkgs: with pkgs; [
  #       xorg.libXcursor
  #       xorg.libXi
  #       xorg.libXinerama
  #       xorg.libXScrnSaver
  #       libpng
  #       libpulseaudio
  #       libvorbis
  #       stdenv.cc.cc.lib
  #       libkrb5
  #       keyutils
  #     ];
  #   };
  # };



  #programs.firefox = {
  #  enable = true;
  #  policies = {
  #    "SearchSuggestEnabled" = false;
  #  };
  #}

  #  Unstable packages
  #home.packages = with nixpkgs-unstable; [
  #  obsidian
  #];


  #programs.bash = {
  # shellAliases = {
  #    nv = "nvim";
  #  };
  #};
  programs.bash.enable = true;
  programs.fish = {
    enable = true;
    plugins = [
      { name = "pure"; src = pkgs.fishPlugins.pure.src; }
      ];
  };


  home.shellAliases = {
    nv = "nvim";
  };

  home.sessionVariables = {
    #PF_INFO = "ascii title os kernel pkgs uptime shell editor wm palette";
    PF_INFO="ascii title os kernel pkgs shell editor wm palette";
  };

  programs.ssh = {
    enable = true;
    includes = [ "~/.config/ssh/config" ];
    #matchBlocks = {
    #  "m1-gitea" = {
    #    hostname = "localhost";
    #    user = "git";
    #    port = "32769";
    #    identitiesOnly = true;
    #    identityFile = "~/.ssh/id_m1_gh";

    #  };
    #};
  };


  # services.mpd = {
  #   enable = true;
  #   musicDirectory = "/home/emily/Music";
  #   # dataDir = "$XDG_DATA_HOME/.mpd";
  #   extraConfig = ''
  #   audio_output {
  #               type "pipewire"
  #               name "MPD (Music Player Daemon)"
  #   }
# '';

    # network.startWhenNeeded = true;
  # };


#  home.programs.steam = {
#    enable = true;
#    remotePlay.openFirewall = true;
#    dedicatedServer.openFirewall = true;
#    localNetworkGameTransfers.openFirewall = true;
#  };


  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
  
  ########################################################################
  # everything from here is me stuffing this all into ONE file (for now) #
  ########################################################################

  #############
  # from dev/ #
  #############

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    git = {
      enable = true;
      userName = "m1emi1em";
      userEmail = "m1emi1em@proton.me";

      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };

  ###############
  # from stuff/ #
  ###############

  services = {
    mpd = {
      enable = true;
      musicDirectory = "${config.xdg.userDirs.music}";
      extraConfig = ''
    audio_output {
                type "pipewire"
                name "MPD (Music Player Daemon)"
    }
'';
      network.startWhenNeeded = true;
    };

    mpd-discord-rpc = {
      enable = true;
      settings = {
        hosts = [ "localhost:6600" ];
        format = {
          details = "$title";
          state = "On $album by $artist";
        };
      };
    };

    mpd-mpris = {
      enable = true;
      mpd = {
        useLocal = true;
      };
    };

    mpdris2 = {
      enable = true;
      notifications = true;
    };
  };

  programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Mocha";

    settings = {
      enable_audio_bell = false;
      confirm_os_window_close = 0;
    };
  };

  ##############
  # from lang/ #
  ##############
  
  home.file = {
    ".config/fcitx5/conf/clipboard.conf" = {
      text = ''# Trigger Key
TriggerKey=
# Paste Primary
PastePrimaryKey=
# Number of entries
Number of entries=3
# Do not show password from password managers
IgnorePasswordFromPasswordManager=True
# Hidden clipboard content that contains a password
ShowPassword=True
# Seconds before clearing password
ClearPasswordAfter=30'';
    };
  };

  ####################
  # from home/emily/ #
  ####################

  # services = {
  #   hyprpaper = {
  #     enable = true;
  #     settings = {
  #       ipc = "on";
  #     };
  #   };

  #   hyprpolkitagent = {
  #     enable = true;
  #   };
  # };
  
  # Unit/services
  systemd.user.services = {
    break-notify = {
      Unit = {
        Description = "My description!";
      };
      Service = {
        Type = "oneshot";
        ExecStart = "${pkgs.libnotify}/bin/notify-send Break";
      };
      Install = {
        WantedBy = [ "default.target" ];
      };
    };
  };

  systemd.user.timers = {
    break-timer = {
      Unit = {
        Description = "Test notify-send";
      };
      Timer = {
        Unit = "test-notify.service";
        OnCalendar = "*:0/30";
      };
      Install = {
        WantedBy = [ "timers.target" ];
      };
    };
  };
  services = {
    swayosd = {
      enable = true;
    };
  };

  # programs.firefox = {
  #   enable = true;
  # };

  # xdg = {
  #   mimeApps.enable = true;
  # };
}
