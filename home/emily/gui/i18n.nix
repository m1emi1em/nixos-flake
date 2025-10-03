{ lib, pkgs, ... }:
let
  themeName = "catppuccin-mocha-pink";
  kbLayouts = {
    us = "keyboard-us";
    intl = "keyboard-us-altgr-intl";
    jp = "mozc";
    zh-cn = "pinyin";
    zh-tw = "rime";
  };
  layoutGroups = with kbLayouts; [
    [intl jp zh-cn]
  ];
  inherit (builtins) toString elemAt;
  inherit (lib.lists) imap0 imap1;
  inherit (lib) foldl;
  inherit (lib.attrsets) mergeAttrsList recursiveUpdate;
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
          fcitx5-chinese-addons

          # fcitx5-chewing
          # fcitx5-rime
          # rime-data
        ];
        settings = {
          inputMethod = let
            makeLayoutItem = gIdx: idx: itm:
              {
                "Groups/${toString gIdx}/Items/${toString idx}".Name = itm;
              };

            makeGroup = grpIdx: items: let
                groupIndex = toString grpIdx;
                groupName = "Group ${groupIndex}";
                defaultLayoutIM = elemAt items 0;
                processedItems = imap0 (j: jtm: makeLayoutItem grpIdx j jtm) items;
              in {
                GroupOrder."${groupIndex}" = groupName;

                "Groups/${groupIndex}" = {
                  Name = groupName;
                  "Default Layout" = defaultLayoutIM;
                  "DefaultIM" = elemAt items 1;
                };
              } // mergeAttrsList processedItems;

            defaultFallbackLayout = {
              GroupOrder."0" = "Default";
              "Groups/0" = with kbLayouts; {
                Name = "Default";
                "Default Layout" = us;
                "DefaultIM" = us;
              };
              "Groups/0/Items/0".Name = "keyboard-us";
            };

          in
            foldl recursiveUpdate defaultFallbackLayout (imap1 makeGroup layoutGroups);

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
