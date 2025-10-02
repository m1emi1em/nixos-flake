{pkgs, inputs', ... }:
let
  guiPackages = with pkgs; [
    #emacs
    mpv # gui
    discord # gui
    vesktop # gui
    keepassxc # gui
    prismlauncher # gui
    signal-desktop-bin # gui
    ungoogled-chromium # gui


    # mpris-timer
    anki # gui
    qbittorrent # gui, server?
    picard # server

    spotify # gui
    zoom-us # gui
    
    obsidian # gui
    alacritty # gui
    lutris # gui

    # godot_4 # gui
    # aseprite # gui
    # reaper # gui

    playerctl

    libnotify
    wl-clipboard-rs

    qpdf

  ];
in
{
  imports = [
    ./catppuccin.nix
    ./firefox.nix
    ./gaming
    ./hyprland
    ./i18n.nix
    ./kitty.nix
    ./mpd.nix
    ./nsxiv.nix
    ./opentabletdriver
  ];
  home = {
    packages = guiPackages;
  };

  xdg = {
    mimeApps.enable = true;
  };
}
