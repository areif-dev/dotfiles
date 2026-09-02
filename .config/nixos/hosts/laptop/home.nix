{ config, pkgs, ... }: 

{
  imports = [
    ./plasma.nix
  ];

  home.username = "aj";
  home.homeDirectory = "/home/aj";
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
