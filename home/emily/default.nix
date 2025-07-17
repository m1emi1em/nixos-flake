{ pkgs, inputs', inputs, ...}:
{
  imports = [
    # ./../../home.nix
    ./emacs
    ./cli
    ./gui
    inputs.catppuccin.homeModules.catppuccin
  ];

  home = {
    username = "emily";              
    homeDirectory = "/home/emily";
  };
  
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

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
}
