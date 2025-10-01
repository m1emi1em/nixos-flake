{ config, lib, pkgs, ... }:
let
  inherit (lib.trivial) importTOML;
  inherit (lib) stringToCharacters;
  inherit (builtins) elemAt;
in
{
  programs.yazi = {
    enable = true;
    #theme = importTOML ./catppuccin-mocha-pink.toml;
    plugins = {
      git = pkgs.yaziPlugins.git;
    };
    initLua = ''require("git"):setup()
'';
    settings = importTOML ./yazi.toml;

    keymap =  let
      genKeymapEntry = runCommand: keymapString:
          {
            run = "${runCommand}";
            on = stringToCharacters keymapString;
          };
      directoryJump = targetDirectory: shortcut:
        genKeymapEntry "cd ${targetDirectory}" shortcut;
    in {
      mgr.prepend_keymap = let
        makeJumps = list:
          map (a: directoryJump (elemAt a 0) (elemAt a 1)) list;
      in [
        # (directoryJump config.xdg.userDirs.pictures "gp")
        # (directoryJump config.xdg.userDirs.videos "gv")
      ] ++ makeJumps (with config.xdg; [
        [userDirs.pictures "gp"]
        [userDirs.videos "gv"]
        [userDirs.music "gm"]
        [userDirs.documents "gD"]
        ["/home/emily/dev" "gw"]
      ]);
    };
  };
  home.shellAliases = {
    y = "yazi";
  };
}
