{config, pkgs, ...}:
let
  props = {
    window = {
      bg = "#000000";
      fg = "#FFFFFF";
    };
    bar = {
      bg = "#000000";
      fg = "#FFFFFF";
    };
  };

  key-handler-program =
    pkgs.writers.writeFish "key-handler"
      # fish
      ''
switch $argv[1]
       case 'c'
            read -L filename
            wl-copy --type image/png < "$filename"
            notify-send "Copied image to clipboard!" "$filename"
       case '*'
            notify-send "Unknown command $argv[1]"
end
'';

  defaultArgs = "-s f -ao";
in
{
  home = {
    packages = with pkgs; [
      nsxiv
    ];
    shellAliases = {
      # Basic alias with scaling to window, animation enabled and printing marked images to STDOUT on exit
      i = "nsxiv ${defaultArgs}";
      # Slideshow
      is = "nsxiv -S 5 ${defaultArgs}";
    };
  };

  xdg = {
    configFile."nsxiv/exec/key-handler" = {
      executable = true;
      target = "nsxiv/exec/key-handler";
      source = key-handler-program;
    };

    desktopEntries.nsxiv = {
      name = "nsxiv";
      genericName = "Image Viewer";
      exec = "nsxiv ${defaultArgs} %U";
      mimeType = ["image/png" "image/webp" "image/jpeg" "image/gif"];
    };

    mimeApps.defaultApplications = {
      "image/png" = ["nsxiv.desktop"];
      "image/webp" = ["nsxiv.desktop"];
      "image/jpeg" = ["nsxiv.desktop"];
      "image/gif" = ["nsxiv.desktop"];
    };
  };

  xresources.properties = {
    "Nsxiv.window.background" = "${props.window.bg}";
    "Nsxiv.window.foreground" = "${props.window.fg}";
    "Nsxiv.bar.background" = "${props.bar.bg}";
    "Nsxiv.bar.foreground" = "${props.bar.fg}";
  };

  wayland.windowManager.hyprland.settings.windowrulev2 = ["tile,class:^(Nsxiv)$"];
}
