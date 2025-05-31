{ lib, pkgs, inputs, inputs', ...} :
let
  inherit (lib.trivial) importTOML;
  walkerPackage = inputs'.walker.packages.default;
in {
  imports = [ inputs.walker.homeManagerModules.walker ];

  programs.walker = {
    enable = true;
    runAsService = true; # This doesn't fucking work?
    package = walkerPackage;
    config = importTOML ./walker.toml;
  };
}
