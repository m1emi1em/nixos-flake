{pkgs, ...}:
{
  services = {
    hyprpaper = {
      enable = true;
      settings = {
        ipc = "on";
      };
    };
  };
}
