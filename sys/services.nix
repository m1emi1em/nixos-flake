{
  imports = [
    ./ssh.nix
  ];
  services = {
    syncthing = {
      enable = true;
      openDefaultPorts = true;
      settings = {
        gui = {
          user = "emily";
          password = "don'tfuuckingcommitthispasswordyoubsolutefool";
        };

        devices = {
          "Bismuth" = { id = "HVYM6NR-CSG4XFD-6V76ABE-TFFXKSC-Q4NWO3R-ZPGAUBP-OSMVOGD-GCASDAT"; };
        };
      };
    };
  };
}
