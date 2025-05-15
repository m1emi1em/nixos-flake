{ ... } :
{
  services = {
    hyprpaper = {
      enable = true;
      settings = {
        ipc = "on";
      };
    };
   hyprpolkitagent = {
      enable = true;
    };
    hyprsunset = {
      enable = true;
      extraArgs = ["--identity"];
      transitions = {
        sunrise = {
          calendar = "*-*-* 06:00:00";
          requests = [[ "identity" ]];
        };
        bedtime = {
          calendar = "*-*-* 22:00:00";
          requests = [[ "temperature"  "2400"]];
        };
      };
    };
  };
}
