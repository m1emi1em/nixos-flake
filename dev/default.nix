{
  imports = [
    ./git.nix
    #./lang
  ];

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
