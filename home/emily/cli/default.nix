{inputs', inputs, pkgs, ... }:
let
  cliPackages = with pkgs; [
    charm-freeze
    cloc
    duf # util
    glow
    irssi
    pandoc
    pfetch # put in file
    texlive.combined.scheme-full
    yazi # put in file
    yt-dlp
  ];
in
{
  # If this flake ever ends up on a server/homelab setup there will probably need to be a distinction made between CLI programs that are for regular, everyday usage on machines like my desktop or laptop and CLI programs that I'd also want on a server.
  # Because there's dubious value in having hledger or irssi, just as an example, on a server.
  # (Altho in the case of hledger it could also open up the avenue of having some kind of webapp interface I could access on my phone too ngl...)
  imports = [
    ./comma.nix
    ./direnv.nix
    ./fish.nix
    ./git.nix
    ./hledger.nix
    ./hyfetch.nix
    ./nvim.nix
    ./pfetch.nix
    ./ssh.nix
    ./tealdeer.nix
    ./yazi
  ]; 

  home.packages = cliPackages;
}
