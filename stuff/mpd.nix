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
      enable = false;

      settings = {
        hosts = [ "localhost:6600" ];
        format = {
          details = "$title";
          state = "On $album by $artist";
        };
      };
    };

    # network.startWhenNeeded = true;
  };
}
