{
  services.mpd = {
    enable = true;
    musicDirectory = "/home/emily/Music";
    # dataDir = "$XDG_DATA_HOME/.mpd";
    extraConfig = ''
    audio_output {
                type "pipewire"
                name "MPD (Music Player Daemon)"
    }
'';

    services.mpd-discord-rpc = {
      enable = true;
      
    };

    # network.startWhenNeeded = true;
  };
}
