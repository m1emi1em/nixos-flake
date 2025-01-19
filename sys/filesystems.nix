{
  fileSystems."/mnt/BiggusDiskus" = {
    device = "/dev/nvme0n1p2";
    fsType = "ntfs-3g";
    options = [
      "users" 
      "nofail"
      "rw"
      "exec"
    ];
  };
}
