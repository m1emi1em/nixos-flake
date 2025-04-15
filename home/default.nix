{ inputs', ... }:
{
  home-manager = {
    extraSpecialArgs = {
      inherit inputs';
    };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.emily = ./emily; #./../home.nix;
  };
}
