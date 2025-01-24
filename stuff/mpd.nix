{config, pkgs-unstable, ...}:
{
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

  home.packages = [ pkgs-unstable.rmpc ];
}
  
