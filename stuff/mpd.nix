{
  services.mpd = {
    enable = true;
    musicDirectory = "/home/emily/Music";
    extraConfig = ''
    audio_output {
                type "pipewire"
                name "MPD (Music Player Daemon)"
    }
'';

    network.startWhenNeeded = true;
  };
}
