{ config, lib, pkgs, ... }:
let
  inherit (lib.trivial) importTOML;
in
{
  programs.yazi = {
    enable = true;
    #theme = importTOML ./catppuccin-mocha-pink.toml;
    plugins = {
      git = pkgs.yaziPlugins.git;
    };
    initLua = ''require("git"):setup()
'';
    settings = importTOML ./yazi.toml;

    keymap = {
      mgr.prepend_keymap = [
        {
          run = "cd ${config.xdg.userDirs.pictures}";
          on = [ "g" "p" ]; }
      ];
    };
  };
  home.shellAliases = {
    y = "yazi";
  };
}
