{
  description = "m1emi1em NixOS Flake";

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    easy-hosts.url = "github:tgirlcloud/easy-hosts";

    agenix.url = "github:ryantm/agenix";
  };

  outputs = { self, nixpkgs, home-manager, agenix, ... } @ inputs:
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


      hosts = {
        emerald = {
          modules = [
            ./desktop.nix
            ./systems/emerald/hardware-configuration.nix
          ];
        };
        quartz = {
          modules = [
            ./laptop.nix
            ./systems/quartz/hardware-configuration.nix
          ];
        };
      };
    in
      {

        nixosConfigurations = let
          base = nixpkgs.lib.nixosSystem {
            specialArgs = {
              inherit inputs;
            };

            modules = [
              ./base-system.nix
              
              home-manager.nixosModules.home-manager 
              {

                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;

                home-manager.extraSpecialArgs = {
                  inherit inputs;
                };

                # Personal account
                home-manager.users.emily = ./home.nix;
              }
              
              # ({nixpkgs, inputs, home-manager, ...}: {
              #   imports = [
              #     ./home/testificate
              #   ];
              # })

              agenix.nixosModules.default

              { environment.systemPackages = [ agenix.packages.${system}.default ]; }

            ];

          };
          in
          builtins.mapAttrs (hostname: base.extendModules) hosts;
      };
}
