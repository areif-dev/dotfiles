{
  description = "Server flake";

  inputs = {
    pkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    pkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "pkgs-unstable";
    };

    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "pkgs-unstable";
    # };
  };

  outputs = { self, pkgs-unstable, pkgs-stable, home-manager, ... }@inputs:
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
              home-manager.users.aj = import ./hosts/laptop/home.nix;
            }
            # inputs.home-manager.nixosModules.default
          ];
        };

        nas = pkgs-stable.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./hosts/nas/configuration.nix
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

        secure-vm = pkgs-stable.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [
            ./hosts/secure-vm/configuration.nix
          ];
        };

      };
    };
}
