{pkgs, home-manager, inputs, ...}:
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
    ({pkgs, inputs, ...}: 
        {

          home = {
            stateVersion = "24.11";
            packages = with pkgs; [
              charm-freeze
              pfetch
            ];
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
