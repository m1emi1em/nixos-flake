{
  description = "m1emi1em NixOS Flake";

  inputs = {
    # NixOS official package source, using the nixos-24.11 branch here
    #nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    # Unstable package sources
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
  let 
    system = "x86_64-linux";
    #pkgs-unstable = import nixpkgs-unstable {inherit system; config.allowUnfree = true; };
    pkgs = nixpkgs.legacyPackages.${system};

    # idk how to use this :3
    forAllSystems =
      function:
      nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed (
        system: function (
          import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          }
        )
      );
  in
  {
    # Please replace my-nixos with your hostname
    nixosConfigurations.Emerald = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs;
      };

      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./hardware-configuration.nix 
        ./configuration.nix
        ./fonts.nix

        ./sys/desktop.nix
        ./sys/default.nix
        ./nixpkgs.nix

        # home-manager
        home-manager.nixosModules.home-manager 
          {

            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            # Shenanigans for unstable packages
            home-manager.extraSpecialArgs = {
              inherit inputs;
              #inherit pkgs-unstable;
              #proper-pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.system};
              
            };

            # Personal account
            home-manager.users.emily = ./home.nix;
          }
        
        ({nixpkgs, inputs, home-manager, ...}: {
          imports = [
            ./home/testificate
          ];
        })

      ];

    };
  };
}
