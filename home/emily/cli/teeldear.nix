{ ... }:
{
  programs.tealdear = {
    enable = true;
    settings = {
      display = {
        compact = true;
      };
      updates = {
        auto_update = true;
        auto_update_interval_hours = 24;
      };
    };
  };
}
