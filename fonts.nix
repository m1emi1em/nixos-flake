{ config, lib, pkgs, ... }:
{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
  ];

 
  fonts = {
    fontconfig = {
      ultimate.enable = true;
    };
  };
}
