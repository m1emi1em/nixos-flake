{ ... } :
{
  programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Mocha";

    font = {
      name = "FiraCode Nerd Font Mono";
      size = 10;
    };

    settings = {
      enable_audio_bell = false;
      confirm_os_window_close = 0;
    };
  };
}
