{ ... } :
{
  imports = [
    ./hyprsunset.nix
  ];
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
  };
}
