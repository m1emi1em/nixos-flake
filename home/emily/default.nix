{ pkgs, inputs', ...}:
{
  imports = [
    # ./../../home.nix
    ./cli
    ./gui
  ];

  home = {
    username = "emily";              
    homeDirectory = "/home/emily";
  };
  
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

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
