{config, lib, pkgs, ... }:
{
  imports = [
    ./cli
  ];

  
  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
    };
  };

  time.timeZone = "America/New_York";

  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
      
    };
  };

  boot.supportedFilesystems = [ "ntfs" ];

  # feesh
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
}
