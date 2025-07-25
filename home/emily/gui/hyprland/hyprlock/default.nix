{ ... } :
{
  programs.hyprlock = {
    enable = true;
    extraConfig = '''';
    importantPrefixes = [
      "$"
      "bezier"
      "monitor"
      "size"
      "source"
    ];

    settings = {
      general = {
        hide_cursor = true;
      };
      # label = {
      #   monitor = "";
      #   text = "sup nerd";
      #   color = "rgba(255, 255, 255, 1.0)";
      #   font_size = 25;
      #   font_family = "Noto Sans";

      #   position = "0, 80";
      #   halign = "center";
      #   valign = "center";
      # };

      # background = {
      #   monitor = "";
      #   path = "";
      #   color = "rgba(0, 0, 0, 1.0)";
      # };

      # input-field = {
      #   monitor = "";

      #   rounding = 0;
        
      #   position = "0, 0";
      #   halign = "center";
      #   valign = "center";
      # };
    };

    sourceFirst = true;
  };
}
