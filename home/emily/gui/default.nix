{pkgs, inputs', ... }:
let
  guiPackages = with pkgs; [
    emacs
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
    reaper # gui


    libnotify
    wl-clipboard-rs

  ];
in
{
  imports = [
    ./firefox.nix
    ./gaming
    ./hyprland
    ./kitty.nix
    ./mpd.nix
    ./nsxiv.nix
  ];
  home = {
    packages = guiPackages;
  };

  xdg = {
    mimeApps.enable = true;
  };
}
