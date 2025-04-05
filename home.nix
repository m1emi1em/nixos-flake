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
    
    hyprpolkitagent # Auth Agent # gui
    hyprpaper
    dunst # Notification Daemon # gui
    waybar # Status bar # gui
    waypaper  # gui

    xdg-desktop-portal-hyprland # gui
    wofi # gui
    hyprpicker # gui

    hypridle # gui
    hyprlock # gui
    #hyprsysteminfo
    hyprsunset # gui


    rmpc
    kitty
    networkmanagerapplet
    grimblast

    inputs.bb-scripts.legacyPackages.x86_64-linux.scripts.grimblastr
  ];
in
{
  home.username = "emily";
  home.homeDirectory = "/home/emily";

  # Stable packages
  home.packages = unstablePackages;

  imports = [
    # ./lang
    # ./home/emily
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

  # Unstable packages
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
    #9};
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

  services = {
    hyprpaper = {
      enable = true;
      settings = {
        ipc = "on";
      };
    };
  };
  
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

  wayland.windowManager.hyprland =
    let
      terminal = "kitty";
      fileManager = "dolphin";
      appLauncher = "wofi --show drun";
      screenshotTool = "grimblastr";
    in
      {
    enable = true;
    systemd.enable = false;

    settings = {

      "$terminal" = "${terminal}";
      "$fileManager" = "${fileManager}";
      "$menu" = "${appLauncher}";
      "$mainMod" = "SUPER";
      "$screenshotTool" = "${screenshotTool}";

      exec-once = [
        "waybar"
        "nm-applet"
        "waypaper --restore"
      ];

      general = {
        "gaps_in" = 3;
        "gaps_out" = 5;
        "border_size" = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        "resize_on_border" = false;
        "allow_tearing" = true;
        "layout" = "dwindle";
      };

      decoration = {
        rounding = 0;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };
        blur = {
          enabled = true;
          size = 3;
          passes = 1;

          vibrancy = 0.1696;
        };
      };

      # animations = {
      #   enabled = true;
      #   bezier = [
      #     "easein, 0.42, 0, 0.58, 1"
      #     "easeout, 0.42, 0, 1, 1"
      #     "easeinout, 0, 0, 0.58, 1"
      #   ];
      #   animation = [
      #     "windows, 1, 2, easeinout"
      #     "layers, 1, 2, easeinout"
      #     "fade, 1, 2, easeinout"
      #     "border, 1, 2, easeinout"
      #     "borderangle, 1, 2, easeinout"
      #     "workspaces, 1, 4, easeinout"
      #   ];
      # };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
        vrr = 2; # Fullscreen only
      };

      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "caps:super";
        kb_rules = "";

        follow_mouse = 1;
        sensitivity = 0;
        
        accel_profile = "flat";
        force_no_accel = true;
        touchpad = {
          natural_scroll = false;
        };
      };

      gestures = {
        workspace_swipe = false;
      };

      bind = [
        "$mainMod ALT SHIFT, R, exec, hyprctl reload" # Manually reload
        "$mainMod, TAB, focuscurrentorlast" # Go to last focused window

        # "$mainMod Control_L SHIFT, S, exec, $screenshotTool"
        
        # mainMod + hjkl for moving focus between windows
        # "$mainMod, H, movefocus, l"
        # "$mainMod, L, movefocus, r"
        # "$mainMod, K, movefocus, u"
        # "$mainMod, J, movefocus, d"
      ];
    };

    # Bite me
    extraConfig = ''
source = ~/.config/hypr/hyprland_1.conf
'';
  };

  programs.hyprlock = {
    enable = true;
    extraConfig = '''';
    importantPrefixes = [
      "$"
      "bezier"
      "monitor"
      "size"
      "source"
    ];

    settings = {
      general = {
        hide_cursor = true;
      };
      label = {
        monitor = "";
        text = "Hi there, $USER";
        color = "rgba(200, 200, 200, 1.0)";
        font_size = 25;
        font_family = "Noto Sans";

        position = "0, 80";
        halign = "center";
        valign = "center";

      };
    };

    sourceFirst = true;
  };

  # programs.firefox = {
  #   enable = true;
  # };

  # xdg = {
  #   mimeApps.enable = true;
  # };
}
