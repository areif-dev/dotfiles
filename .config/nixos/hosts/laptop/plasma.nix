{ pkgs, ... }:

{
  programs.plasma = {
    enable = true;
    overrideConfig = true;

    input.touchpads = [
      {
        enable = true;
        naturalScroll = true;
        vendorId = "04f3";
        productId = "31ec";
        name = "ELAN07A8:00 04F3:31EC Touchpad";
      }
    ];

    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      iconTheme = "Papirus-Dark";
      cursor = {
        theme = "phinger-cursors-dark";
        size = 24;
      };
      wallpaper = "/home/aj/Pictures/Backgrounds/earth-rise.jpg";
    };
  };
}
