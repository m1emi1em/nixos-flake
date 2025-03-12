{config, lib, pkgs, ...}:
{
  imports = [
    ./neovim.nix
  ];
  
  environment.systemPackages = with pkgs; [
    figlet
    lolcat
    git
    wget
    #neovim # We explicitly install and configure neovim system-wide below
    bat
    btop
    htop
    ranger
    unzip
    tmux
    dua
    swayfx
    wofi
    just
    kitty
    p7zip
    tealdeer
    tree
  #  wget
    ripgrep
  ];
}
