{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      pfetch
    ];

    sessionVariables = {
      PF_INFO="ascii title os kernel pkgs shell editor wm palette";
    };
  };
}
