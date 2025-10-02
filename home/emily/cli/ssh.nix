{ ... }:
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    # includes = [ "~/.config/ssh/config" ];
    matchBlocks = {
      "m1-gitea" = {
        hostname = "localhost";
        user = "git";
        identityFile = "~/.ssh/id_gh";
        identitiesOnly = true;
      };
      "m1-github" = {
        hostname = "github.com";
        user = "git";
        port = 32769;
        identityFile = "~/.ssh/id_gh";
        identitiesOnly = true;
      };
      "m1-tangled" = {
        hostname = "tangled.org";
        user = "git";
        identityFile = "~/.ssh/id_tngld";
        identitiesOnly = true;
      };
    };
  };
}
