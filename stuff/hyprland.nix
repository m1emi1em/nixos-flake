{pkgs, ...}:
let
  hyprland-packages = with pkgs; [
    
    hyprpolkitagent # Auth Agent # gui
    hyprpaper
    dunst # Notification Daemon # gui
    waybar # Status bar # gui
    waypaper  # gui

    xdg-desktop-portal-hyprland # gui
    wofi # gui
    hyprpicker # gui

    hypridle # gui
    hyprlock # gui
    #hyprsysteminfo
    hyprsunset # gui
    
  ];
in
{
  home.packages = hyprland-packages;
  
}
