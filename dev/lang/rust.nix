{pkgs-unstable, ...}:
{
  home.packages = with pkgs-unstable; [
    rustc
    cargo
  ];
}
