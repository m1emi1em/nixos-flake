{ pkgs, inputs', inputs, ...}:
{
  services.syncthing = {
    enable = true;
    settings = {
      devices = {
        "Bismuth" = { id = "HVYM6NR-CSG4XFD-6V76ABE-TFFXKSC-Q4NWO3R-ZPGAUBP-OSMVOGD-GCASDAT"; };
      };
      # folders = {
      #   "Current Vaults" = {
      #     id = "obsidian-vaults-current";
      #     path = "/mnt/BiggusDiskus/Vaults/Current";
      #     devices = ["Bismuth" "quartz"];
      #   };
      # };
    };
  };
}
