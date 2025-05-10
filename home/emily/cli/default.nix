{inputs', pkgs, ... }:
let
  cliPackages = with pkgs; [
    charm-freeze
    duf # util
    hledger
    hyfetch
    irssi
    pandoc
    pfetch # put in file
    texlive.combined.scheme-full
    yazi # put in file
    yt-dlp
  ];
in
{
  imports = [
    ./ssh.nix
    ./direnv.nix
    ./fish.nix
    ./git.nix
    ./nvim.nix
    ./pfetch.nix
    ./yazi.nix
    ./tealdeer.nix
  ]; 

  home.packages = cliPackages;
}
