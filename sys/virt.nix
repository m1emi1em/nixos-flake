{
  virtualisation.oci-containers.containers = {
    "gitea" = {
      autoStart = true;
      image = "gitea/gitea";
      ports = [ "32769:22" "32768:3000"];
      environment = {
        #USER_UID = "1000";
        #USER_GID = "1000";
        USER = "git";
        GITEA_CUSTOM = "/data/gitea";
      };
      volumes = [
        "/home/volumes/gitea/data:/data"
        "/etc/timezone:/etc/timezone:ro"
        "/etc/localtime:/etc/localtime:ro"
      ];
    };
  };
}
