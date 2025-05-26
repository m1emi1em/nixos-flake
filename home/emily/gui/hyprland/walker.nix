{ pkgs, inputs, ...} : {
  imports = [ inputs.walker.homeManagerModules.walker ];

  programs.walker = {
    enable = true;
    runAsService = true;
    package = pkgs.walker;
  };
}
