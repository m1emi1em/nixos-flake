{
  description = "m1emi1em NixOS Flake";

  inputs = {
    # NixOS official package source, using the nixos-24.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    # Unstable package sources
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # home-manager
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };


  };

  outputs = { self, nixpkgs, home-manager, nixpkgs-unstable, ... } @ inputs:
  let 
    system = "x86_64-linux";
    pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
    #pkgs-unstable = import nixpkgs-unstable {inherit system; config.allowUnfree = true; };
    pkgs = nixpkgs.legacyPackages.${system};

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

    pkgs.config.allowUnfree = true;
    
    # Please replace my-nixos with your hostname
    nixosConfigurations.Emerald = nixpkgs.lib.nixosSystem {
      #system = "x86_64-linux";
      #inherit system;
      specialArgs = {
        inherit inputs;
        #system = "x86_64-linux";
      };

      
      
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./configuration.nix
        ./fonts.nix

        ./sys/desktop.nix
        ./nixpkgs.nix

        # home-manager
        home-manager.nixosModules.home-manager 
          {

            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            # Shenanigans for unstable packages
            home-manager.extraSpecialArgs = {
              inherit inputs;
              inherit pkgs-unstable;
              proper-pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.system};
              
            };


            # Personal account
            home-manager.users.emily = import ./home.nix;
          }
        

        ({nixpkgs, inputs, home-manager, ...}: {
          # home-manager.nixosModules.home-manager = {
          #   extraSpecialArgs = {
          #     inherit inputs;
          #   };
          # };
          imports = [
            ./home/testificate
          ];
        })

      ];

    };
  };
}
