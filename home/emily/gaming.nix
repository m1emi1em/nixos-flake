{config, pkgs, inputs, ...} :
{
  home.packages = with pkgs; [
    osu-lazer-bin
  ];
}
