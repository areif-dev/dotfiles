{
  description = "Server flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixstable.url = "github:nixos/nixpkgs/nixos-24.05";
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";

    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { self, nixpkgs, nixstable, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
    
      nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./hosts/laptop/configuration.nix
            # inputs.home-manager.nixosModules.default
          ];
        };

        home-nas = nixstable.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./hosts/home-nas/configuration.nix
            # inputs.home-manager.nixosModules.default
          ];
        };

        remote = nixstable.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./hosts/remote/configuration.nix
            # inputs.home-manager.nixosModules.default
          ];
        };

      };
    };
}
