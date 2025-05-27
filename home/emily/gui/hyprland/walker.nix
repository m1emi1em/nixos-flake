{ lib, pkgs, inputs, ...} :
let
  inherit (lib.trivial) importTOML;
in {
  imports = [ inputs.walker.homeManagerModules.walker ];

  programs.walker = {
    enable = true;
    runAsService = true;
    package = pkgs.walker;
    config = importTOML ./walker.toml;
  };
}
