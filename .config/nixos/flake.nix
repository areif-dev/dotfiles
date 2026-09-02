{
  description = "Server flake";

  inputs = {
    pkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    pkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05";
  };

  outputs = { self, pkgs-unstable, pkgs-stable, ... }@inputs:
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
