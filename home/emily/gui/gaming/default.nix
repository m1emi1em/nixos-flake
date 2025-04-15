{ pkgs, ... }:
let
  gamingPackages = with pkgs; [
    gamescope
    mangohud
    osu-lazer-bin
    piper
  ];
in
{
  home.packages = gamingPackages;
}
