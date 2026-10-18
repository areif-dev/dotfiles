{ config, pkgs, ... }:

{
  imports = [
    ./plasma.nix
  ];

  home.username = "aj";
  home.homeDirectory = "/home/aj";
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
    };
  };
}
