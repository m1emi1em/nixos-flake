{ ... } :
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mainMod, E, exec, uwsm app -- $terminal"
      "$mainMod, Q, killactive,"
      "$mainMod ALT Control_L, backspace, exec, uwsm stop"
      # "$mainMod, E, exec, $fileManager"
      # "$mainMod, V, togglefloating,"
      "$mainMod, R, exec, uwsm app -- $menu"


      "$mainMod ALT SHIFT, R, exec, uwsm app -- hyprctl reload" # Manually reload
      "$mainMod, TAB, focuscurrentorlast" # Go to last focused window

      "$mainMod Control_L, PRINT, exec, uwsm app -- $screenshotTool" # Take screenhot
      "$mainMod SHIFT, P, pin, active"
      "$mainMod, F, fullscreenstate, 1"

      
      "$mainMod, N, exec, hyprpanel toggleWindow notificationsmenu" # Toggle notifications
      # "$mainMod SHIFT, N, exec, uwsm app -- swaync-client -d" # Toggle DND


      "$mainMod Control_L SHIFT, L, exec, uwsm app -- hyprlock" # Lock screen

      # Move between windows
      "$mainMod, H, movefocus, l"
      "$mainMod, L, movefocus, r"
      "$mainMod, K, movefocus, u"
      "$mainMod, J, movefocus, d"

      # Move windows in direction
      "$mainMod SHIFT, H, movewindow, l"
      "$mainMod SHIFT, L, movewindow, r"
      "$mainMod SHIFT, K, movewindow, u"
      "$mainMod SHIFT, J, movewindow, d"

      # Move between workspaces
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"
      
      # Move window to workspace
      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      "$mainMod SHIFT, 0, movetoworkspace, 10"


      # Go forwards and backwards in workspaces
      # "$mainMod, ], workspace, e+1"
      # "$mainMod, ], workspace, e-1"


      # Special workpspace
      "$mainMod, S, togglespecialworkspace, magic"
      "$mainMod SHIFT, S, movetoworkspace, special:magic"
    ];
  };
}
