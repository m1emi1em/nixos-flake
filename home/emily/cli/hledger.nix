{ pkgs, ... } : {
  home = {
    packages = with pkgs; [
      hledger
      hledger-ui
      puffin
    ];
    shellAliases = {
      hl = "hledger";
      pf = "puffin";
    };
  };
}
