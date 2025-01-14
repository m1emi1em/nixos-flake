{config, lib, pkgs, home-manager, inputs, ...}:
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
    ({config, pkgs, inputs, ...}: 
      let
        proper-pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.system};
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
