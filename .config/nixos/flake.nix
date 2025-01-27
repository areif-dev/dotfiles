{
  description = "Server flake";

  inputs = {
    pkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    pkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";

    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "pkgs-unstable";
    # };
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
