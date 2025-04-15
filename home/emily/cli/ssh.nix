{...}:
{
  programs.ssh = {
    enable = true;
    includes = [ "~/.config/ssh/config" ];
    #matchBlocks = {
    #  "m1-gitea" = {
    #    hostname = "localhost";
    #    user = "git";
    #    port = "32769";
    #    identitiesOnly = true;
    #    identityFile = "~/.ssh/id_m1_gh";

    #  };
    #};
  };
}
