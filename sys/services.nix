{
  services = {
    syncthing = {
      enable = true;
      openDefaultPorts = true;
      settings = {
        gui = {
          user = "emily";
          password = "incorrectgoatringtwormtassel";
        };

        devices = {
          "Bismuth" = { id = "HVYM6NR-CSG4XFD-6V76ABE-TFFXKSC-Q4NWO3R-ZPGAUBP-OSMVOGD-GCASDAT"; };
        };

        folders = {
          "Obsidian" = {
            id = "obsidian-vaults-current";
            path = "/mnt/BiggusDiskus/Vaults/Current";
            devices = ["Bismuth"];
          };
        };
      };
    };
  };
}
