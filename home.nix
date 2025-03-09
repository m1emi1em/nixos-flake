{config, pkgs, inputs, ...} :
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
    logseq # gui

    charm-freeze # util

    gamescope # gui
    mangohud  # gui
  ];
in
{
  home.username = "emily";
  home.homeDirectory = "/home/emily";

  # Stable packages
  home.packages = unstablePackages;

  imports = [
    ./stuff
    ./dev
    ./lang
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
}
