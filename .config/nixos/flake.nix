{
  description = "Server flake";

  inputs = {
    pkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    pkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
    pkgs-192e92d.url = "github:nixos/nixpkgs/192e92d56844a401ed77011ff476f6d40864eeb5";

    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "pkgs-unstable";
    # };
  };

  outputs = { self, pkgs-unstable, pkgs-stable, pkgs-192e92d, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = pkgs-unstable.legacyPackages.${system};
    in
    {
    
      nixosConfigurations = {
        laptop = pkgs-unstable.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            pkgs-192e92d = import pkgs-192e92d {
              inherit system; 
              config.allowUnfree = true;
            };
          };
          modules = [ 
            ./hosts/laptop/configuration.nix
            # inputs.home-manager.nixosModules.default
          ];
        };

        home-nas = pkgs-stable.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./hosts/home-nas/configuration.nix
            # inputs.home-manager.nixosModules.default
          ];
        };

        remote = pkgs-stable.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./hosts/remote/configuration.nix
            # inputs.home-manager.nixosModules.default
          ];
        };

      };
    };
}
