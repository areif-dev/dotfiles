{ pkgs, ... }: 

{
  programs.plasma = {
    enable = true; 
    overrideConfig = true; 

    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      iconTheme = "Papirus-Dark";
      cursor = {
        theme = "phinger-cursors-dark";
        size = 24;
      };
      wallpaper = "/home/aj/Pictures/Backgrounds/earth-rise.jpg";
    };
  }
}
