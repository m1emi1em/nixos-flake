This is non-exhaustive list of things I'd like to look into or do with this flake.

# Additions

## Flake

- Stylix
- Secrets management via agenix
  - Syncthing, SSH keys
- More general system modules rather than fixed ones specifically for my current laptop and desktop

## Features/Configurations

- Sitelen Pona rendering and input
- Disk health monitoring
- Radicale/Etebase+Etesync for CalDAV syncing of tasks
- Declarative Firefox configuration
- Might migrate to Forgejo from Gitea idk

# To Fix

- Dolphin under hyprland prompts for what to open files with even for things we've explicitly assigned mime-handlers for like nsxiv
- CJK rendering is using Chinese-style characters I think? Some Japanese characters are rendered with in Chinese format supposedly?
  - 零 is where this was noticed. Even just typing it out the bottom part is rendered differently in the mozc popup than it is in emacs

## Specific Things

- hyprlock: add background, generally just tweak the config provided by the catppuccin flake


### Emacs

- Figure out treesitter and set that up
- TS tooling

### fcitx5

- What's up with that popup about GTK_IM_MODULES or w/e
- Keybinds for swapping groups

### hyprpanel

- Limit max # of tray icons at once and have a way to expand it temporarily?
- Weather API key
- Customize workspace widget

### hyprland

- better workspace binds than 0-9
- auto-assign workspaces for certain programs (like games, steam, emacs, firefox, discord, terms etc)

## Laptop

- Wireless network connections aren't remembered between boot with hyprpanel/hyprland
  - Have to manually reconnect and re-enter password via nmtui
- Notification window position is halfway offscreen
