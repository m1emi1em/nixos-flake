{ pkgs, ... }:
{
  home.packages = with pkgs; [ hyfetch ];
  programs.hyfetch = {
    enable = true;
    settings  = {
      "preset" = "lesbian";
      "mode" = "rgb";
      "light_dark" = "dark";
      "lightness" = 0.65;
      "color_align" = {
        "mode" = "custom";
        "custom_colors" = {
          "1" = 3;
          "2" = 0;
          "3" = 4;
          "4" = 0;
          "5" = 1;
          "6" = 0;
        };
        "fore_back" = [];
      };
      "backend" = "neofetch";
      "args" = "--disable model resolution icons";
      "distro" = "nixos_colorful";
      "pride_month_shown" = [];
      "pride_month_disable" = false;
    };
  };
}
