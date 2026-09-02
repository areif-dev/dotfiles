{
  description = "Server flake";

  inputs = {
    pkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    pkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "pkgs-unstable";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "pkgs-unstable";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = { self, pkgs-unstable, pkgs-stable, home-manager, plasma-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = pkgs-unstable.legacyPackages.${system};
    in
    {
    
      nixosConfigurations = {
        laptop = pkgs-unstable.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = [ 
            ./hosts/laptop/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true; 
              home-manager.sharedModules = [ plasma-manager.homeModules.plasma-manager ];
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.users.aj = import ./hosts/laptop/home.nix;
            }
          ];
        };

        nas = pkgs-stable.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./hosts/nas/configuration.nix
          ];
        };

        remote = pkgs-stable.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./hosts/remote/configuration.nix
          ];
        };

        secure-vm = pkgs-stable.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [
            ./hosts/secure-vm/configuration.nix
          ];
        };

      };
    };
}
