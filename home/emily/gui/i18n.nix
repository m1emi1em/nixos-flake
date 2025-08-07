{ pkgs, ... }:
let
  themeName = "catppuccin-mocha-pink";
  kbLayouts = {
    intl = "keyboard-us-altgr-intl";
    jp = "mozc";
  };
in
{
  i18n = {
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        waylandFrontend = true;
        addons = with pkgs; [
          fcitx5-mozc
          fcitx5-gtk
          catppuccin-fcitx5
        ];
        settings = {
          inputMethod = {
            GroupOrder."0" = "Default";

            "Groups/0" = {
              Name = "Default";
              "Default Layout" = "us";
              "DefaultIM" = "us";
            };
            "Groups/0/Items/0".Name = "keyboard-us";

            GroupOrder."1" = "International";
            "Groups/1" = {
              Name = "International";
              "Default Layout" = kbLayouts.intl;
              "DefaultIM" = "mozc";
            };

            "Groups/1/Items/0".Name = kbLayouts.intl;
            "Groups/1/Items/1".Name = kbLayouts.jp;


          };
          addons = {
            # Get rid of that obnoxious popup that conflicts with some emacs bind
            clipboard.globalSection = {
              TriggerKey = "";
              PastePrimaryKey = "";
              "Number of entries" = "3";
              IgnorePasswordFromPasswordManager= "True";
              ShowPassword="True";
              ClearPasswordAfter="30";
            };
            classicui.globalSection.Theme = themeName;
          };
        };
      };
    };
  };
}
