{ config, pkgs, ... }:
let
  otdConfigDirectory = "OpenTabletDriver";
  settingsFilename = "settings.json";
  otdConfigFilename = "${otdConfigDirectory}/${settingsFilename}";
in
{
  xdg.configFile = {
    ${otdConfigFilename} = {
      # why does emacs insist on indenting this like this lol
      enable = true;
      source = ./settings.json;
    };
  };
}
