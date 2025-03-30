{
  description = "m1emi1em NixOS Flake";

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    easy-hosts.url = "github:tgirlcloud/easy-hosts";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    agenix.url = "github:ryantm/agenix";
  };

  outputs = { self, nixpkgs, easy-hosts, flake-parts, home-manager, agenix, ... } @ inputs: let
    mkHomeManagerModule = {}: {
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
    };
  in flake-parts.lib.mkFlake {inherit inputs;} {
    systems = ["x86_64-linux"];
    imports = [
      easy-hosts.flakeModule
    ];
    easy-hosts = {
      shared.modules = [
        agenix.nixosModules.default
        home-manager.nixosModules.home-manager 
        ./base-system.nix
        ({pkgs, ...}: { environment.systemPackages = [ agenix.packages.${pkgs.system}.default ]; })
      ];
      hosts = {
        emerald = {
          arch = "x86_64";
          class = "nixos";
          modules = [
            ./systems/emerald/hardware-configuration.nix
            ./desktop.nix
            (mkHomeManagerModule {})
            ./home/testificate
          ];
        };
        quartz = {
          arch = "x86_64";
          class = "nixos";
          modules = [
            ./systems/quartz/hardware-configuration.nix
            ./laptop.nix
            (mkHomeManagerModule {})
          ];
        };
      };
    };
  };
}
