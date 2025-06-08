{lib, ...}:
let
  inherit (lib.trivial) importTOML;
in
{
  programs.yazi = {
    enable = true;
    theme = importTOML ./catppuccin-mocha-pink.toml;
  };
  home.shellAliases = {
    y = "yazi";
  };
}
