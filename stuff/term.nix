{pkgs-unstable, ...}:
{
  home.packages = with pkgs-unstable; [ kitty ];

  programs.kitty = {
    enableBashIntegration = true;
    enableFishIntegration = true;
    themeFile = "Catppuccin-Mocha";

    settings = {
      enable_audio_bell = false;
    };
  };
}
