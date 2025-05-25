{ inputs', inputs, ... }:
{
  home-manager = {
    extraSpecialArgs = {
      inherit inputs';
      inherit inputs;
    };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.emily = ./emily; #./../home.nix;
    backupFileExtension = "backup";
  };

  nixpkgs.overlays = [inputs.hyprpanel.overlay];
  
  # imports = [
  #   inputs.hyprpanel.homeManagerModules.hyprpanel
  # ];
}
