{pkgs, home-manager, inputs, proper-pkgs-unstable, ...}:
let
  myUserName = "testificate";
  myHomeDir = "/home/" + myUserName; 
in
{
  
  users.users.testificate = {
    isNormalUser = true;
    description = "Testificate";
    extraGroups = ["wheel"];
  };

  home-manager.users.testificate =
    ({pkgs, inputs, proper-pkgs-unstable, ...}: 
      let
        stablePackages = with pkgs; [
          charm-freeze
        ];
        unstablePackages = with proper-pkgs-unstable; [
          pfetch
        ];
      in
        {

          home = {
            stateVersion = "24.11";
            packages = stablePackages ++ unstablePackages;
          };

          programs = {
            home-manager.enable = true;

            # fish = {
            #   enable = true;
            #   plugins = [
            #     { name = "pure"; src = pkgs.fishPlugins.pure.src; }
            #   ];
            # };
          };
        }
    );
}
