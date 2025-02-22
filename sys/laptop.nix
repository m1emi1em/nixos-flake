{config, lib, pkgs, ...}:
{
  networking = {
    hostName = "quartz";
  };

  services = {
    syncthing = {
      settings = {
        devices = {
          "Emerald" = { id = "INKFIAW-55AWZP4-WSXYO7Z-YU2GBBU-QHYZMOD-YEZOHAI-N7V7UFT-NYG4RQC"; };
        };
      };
    };
  };
}
