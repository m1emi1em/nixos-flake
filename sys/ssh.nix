{
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
  };

  users.users."emily".openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBR3yUt3t1RB0QzRDBKtiY5P5gk+kCWr+7/cSVg2DO3"
  ];
}
