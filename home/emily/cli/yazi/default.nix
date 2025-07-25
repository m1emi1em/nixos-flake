{ lib, pkgs, ... }:
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
  };
  home.shellAliases = {
    y = "yazi";
  };
}
