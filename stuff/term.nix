{pkgs, ...}:
{
  home.packages = with pkgs; [ kitty ];

  programs.kitty = {
    enable = true;
    shellIntegration = {
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
    };
    themeFile = "Catppuccin-Mocha";

    settings = {
      enable_audio_bell = false;
      confirm_os_window_close = 0;
    };
  };
}
