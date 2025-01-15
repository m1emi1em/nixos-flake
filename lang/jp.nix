{pkgs, ...}:
{
  # i18n = {
  #   inputMethod = {
  #     enabled = "fcitx5";
  #     fcitx5.addons = with pkgs; [
  #       fcitx5-mozc
  #       fcitx5-gtk
  #       catppuccin-fcitx5
  #     ];
  #   };
  # };

  home.file = {
    ".config/fcitx5/conf/clipboard.conf" = {
      text = ''# Trigger Key
TriggerKey=
# Paste Primary
PastePrimaryKey=
# Number of entries
Number of entries=3
# Do not show password from password managers
IgnorePasswordFromPasswordManager=True
# Hidden clipboard content that contains a password
ShowPassword=True
# Seconds before clearing password
ClearPasswordAfter=30'';
    };
  };
    
}
