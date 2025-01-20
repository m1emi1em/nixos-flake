{
  imports = [
    ./git.nix
    ./lang
  ];

  programs = {
    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
