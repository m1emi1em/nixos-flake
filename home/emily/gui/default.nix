{pkgs, inputs', ... }:
let
  guiPackages = with pkgs; [
    emacs
    mpv # gui
    discord # gui
    vesktop # gui
    keepassxc # gui
    prismlauncher # gui
    signal-desktop # gui
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

    godot_4 # gui
    aseprite # gui
    reaper # gui


    libnotify

  ];
in
{
  imports = [
    ./hyprland
    ./kitty.nix
    ./gaming
    ./mpd.nix
  ];
  home = {
    packages = guiPackages;
  };
}
