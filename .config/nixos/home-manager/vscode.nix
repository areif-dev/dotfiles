{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true; 
    package = pkgs.vscodium; 
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        catppuccin.catppuccin-vsc
        esbenp.prettier-vscode
        golang.go 
        ms-python.python 
        rust-lang.rust-analyzer
        vscodevim.vim
      ];
      userSettings = {
        "files.associations" = {
          "*.gohtml" = "html";
        };
        "[javascript]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[css]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[html]" = {
          "editor.defaultFormatter" = "vscode.html-language-features";
        };
        "editor.linkedEditing" = true;
        "editor.rulers" = [ 80 120 ];
        "editor.formatOnSave" = true;
        "html.autoClosingTags" = true;
        "javascript.autoClosingTags" = true;
        "typescript.autoClosingTags" = true;
        "workbench.colorTheme" = "Catppuccin Mocha";        
      };
    };
  };
}
