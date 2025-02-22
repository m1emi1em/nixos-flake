{pkgs, ...}:
{
  home.packages = with pkgs; [
    leiningen
    babashka
    clojure
  ];

}
