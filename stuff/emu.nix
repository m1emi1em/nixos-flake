{pkgs-unstable, ...}:
{
  home.packages = with pkgs-unstable; [
    retroarch-full
  ];
}
