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
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    easy-hosts.url = "github:tgirlcloud/easy-hosts";

    agenix.url = "github:ryantm/agenix";

    bb-scripts = {
      url ="git+http://emerald.localdomain:32768/m1emi1em/bb-scripts.git";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };
    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, agenix, flake-parts, easy-hosts, ... } @ inputs: let
    # mkHomeManagerModule = {} : {
    #   home-manager.useGlobalPkgs = true;
    #   home-manager.useUserPackages = true;
    #   home-manager.users.emily = ./home.nix;
    # };

    baseHost = {
      arch = "x86_64";
      class = "nixos";
    };
    
    # :3c
    buildHost = host: baseHost // host;

    myHosts = {
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
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [ "x86_64-linux" ];
      imports = [ easy-hosts.flakeModule ];

      easy-hosts = {
        shared = {
          specialArgs = { inherit inputs; }; 
          modules = [
            ./base-system.nix
            home-manager.nixosModules.home-manager 
            # (mkHomeManagerModule {})
            # ({inputs', ...}: {home-manager.extraSpecialArgs = {inherit inputs';};} )
            # {home-manager.extraSpecialArgs = { inherit inputs; }; }
            agenix.nixosModules.default
            ./home
          ];
        };
        # >:3c
        hosts = builtins.mapAttrs (name: buildHost) myHosts;
      };
    };
}
