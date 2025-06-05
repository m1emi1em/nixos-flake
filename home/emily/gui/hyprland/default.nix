{ pkgs, inputs', ... } :
let
  hyprlandPackages = with pkgs;
    [
      hyprpolkitagent # Auth Agent # gui
      hyprpaper
      waybar # Status bar # gui
      waypaper  # gui
      wofi
      hyprpicker
      hypridle
      hyprlock
      hyprsunset
      xdg-desktop-portal-hyprland # gui
      kitty
      networkmanagerapplet
      grimblast

      # inputs.bb-scripts.legacyPackages.x86_64-linux.scripts.grimblastr
      inputs'.bb-scripts.legacyPackages.scripts.grimblastr
    ];
in
{
  imports = [
    ./binds.nix
    ./services.nix
    ./hyprlock
    ./hyprpanel.nix
  ];
  
  home.packages = hyprlandPackages;
  
  wayland.windowManager.hyprland =
    let
      terminal = "kitty";
      fileManager = "dolphin";
      # appLauncher = "wofi --show drun";
      appLauncher = "$(wofi --show drun --define=print_desktop_file=true)";
      screenshotTool = "grimblastr";
      uwsmWrap = command: "uwsm app -- " + command;
      uwsmWrapAll = list: map uwsmWrap list;
    in
      {
        enable = true;
        systemd.enable = false;

        settings = {

          ecosystem = {
            no_update_news = true;
          };

          "$terminal" = "${terminal}";
          "$fileManager" = "${fileManager}";
          "$menu" = "${appLauncher}";
          "$mainMod" = "SUPER";
          "$screenshotTool" = "${screenshotTool}";

          exec-once = uwsmWrapAll [
            "waypaper --restore"
          ];

          general = {
            "gaps_in" = 3;
            "gaps_out" = 5;
            "border_size" = 2;
            "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
            "col.inactive_border" = "rgba(595959aa)";
            "resize_on_border" = false;
            "allow_tearing" = true;
            "layout" = "dwindle";
          };

          decoration = {
            rounding = 0;
            active_opacity = 1.0;
            inactive_opacity = 1.0;
            shadow = {
              enabled = true;
              range = 4;
              render_power = 3;
              color = "rgba(1a1a1aee)";
            };
            blur = {
              enabled = true;
              size = 3;
              passes = 1;

              vibrancy = 0.1696;
            };
          };

          # animations = {
          #   enabled = true;
          #   bezier = [
          #     "easein, 0.42, 0, 0.58, 1"
          #     "easeout, 0.42, 0, 1, 1"
          #     "easeinout, 0, 0, 0.58, 1"
          #   ];
          #   animation = [
          #     "windows, 1, 2, easeinout"
          #     "layers, 1, 2, easeinout"
          #     "fade, 1, 2, easeinout"
          #     "border, 1, 2, easeinout"
          #     "borderangle, 1, 2, easeinout"
          #     "workspaces, 1, 4, easeinout"
          #   ];
          # };

          dwindle = {
            pseudotile = true;
            preserve_split = true;
          };

          master = {
            new_status = "master";
          };

          misc = {
            force_default_wallpaper = -1;
            disable_hyprland_logo = false;
            vrr = 2; # Fullscreen only
            focus_on_activate = true; # Need this for obsidian web clipper to work, apparently
          };

          input = {
            kb_layout = "us";
            kb_variant = "";
            kb_model = "";
            kb_options = "caps:super";
            kb_rules = "";

            follow_mouse = 1;
            sensitivity = 0;
            
            accel_profile = "flat";
            force_no_accel = true;
            touchpad = {
              natural_scroll = false;
            };
          };

          gestures = {
            workspace_swipe = false;
          };

        };

        # Bite me
        extraConfig = ''
source = ~/.config/hypr/hyprland_1.conf
'';
      };
}
