{ ... }:
{
  services.hyprsunset = {
    enable = true;
    extraArgs = ["--identity"];
    settings = {
      profile = [
        {
          time = "6:00";
          identity = true;
        }
        {
          time = "22:00";
          temperature = 2400;
        }
      ];
    };
  };
}
