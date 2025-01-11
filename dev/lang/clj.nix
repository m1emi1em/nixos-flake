{pkgs, pkgs-unstable, ...}:
let
  stable-pkgs = with pkgs; [
  ];
  unstable-pkgs = with pkgs-unstable; [
    leiningen
    babashka
    clojure
  ];
in
{
  home.packages = stable-pkgs ++ unstable-pkgs;

}
