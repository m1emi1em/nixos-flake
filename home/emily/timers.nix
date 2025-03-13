{pkgs, ...}:
{

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
}
