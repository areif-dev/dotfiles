{ pkgs, ... }:
{
  programs.plasma = {
    overrideConfig = true;
    enable = true;
    panels = [
      {
        location = "top";
        height = 22;
        floating = true;
        hiding = "none";
      }
    ];

    workspace = {
      cursor = {
        theme = "phinger-cursors-dark";
        size = 24;
      };
      iconTheme = "Papirus-Dark";
      lookAndFeel = "org.kde.breezedark.desktop";
      wallpaper = "/home/aj/Pictures/Backgrounds/earth-rise.jpg";
    };

    kwin.scripts.polonium = {
      enable = true;
      settings = {
        borderVisibility = "borderSelected";
        layout.engine = "binaryTree";
        maximizeSingleWindow = true;
      };
    };

    startup.startupScript."start_apps" = {
      text = ''
        syncthing &
        thunderbird &
        keepassxc &
      '';
      priority = 2;
    };

    shortcuts = {
      ActivityManager.switch-to-activity-08633b98-a783-47e0-ad36-4919228cc9f8 = [ ];
      "KDE Keyboard Layout Switcher"."Switch to Last-Used Keyboard Layout" = "Meta+Alt+L";
      "KDE Keyboard Layout Switcher"."Switch to Next Keyboard Layout" = "Meta+Alt+K";
      kaccess."Toggle Screen Reader On and Off" = "Meta+Alt+S";
      kmix.decrease_microphone_volume = "Microphone Volume Down";
      kmix.decrease_volume = "Volume Down";
      kmix.decrease_volume_small = "Shift+Volume Down";
      kmix.increase_microphone_volume = "Microphone Volume Up";
      kmix.increase_volume = "Volume Up";
      kmix.increase_volume_small = "Shift+Volume Up";
      kmix.mic_mute = [
        "Microphone Mute"
        "Meta+Volume Mute"
      ];
      kmix.mute = "Volume Mute";
      kmix.push_to_talk = [ ];
      ksmserver."Halt Without Confirmation" = [ ];
      ksmserver."Lock Session" = [
        "Screensaver"
        "Meta+L"
      ];
      ksmserver."Log Out" = "Ctrl+Alt+Del";
      ksmserver."Log Out Without Confirmation" = [ ];
      ksmserver.LogOut = [ ];
      ksmserver.Reboot = [ ];
      ksmserver."Reboot Without Confirmation" = [ ];
      ksmserver."Shut Down" = [ ];
      kwin."Activate Window Demanding Attention" = "Meta+Ctrl+A";
      kwin."Cycle Overview" = [ ];
      kwin."Cycle Overview Opposite" = [ ];
      kwin."Decrease Opacity" = [ ];
      kwin."Edit Tiles" = "Meta+T";
      kwin.Expose = [
        "Ctrl+F9"
        "Meta+F9"
      ];
      kwin.ExposeAll = [
        "Launch (C)"
        "Ctrl+F10"
        "Meta+F10"
      ];
      kwin.ExposeClass = [
        "Ctrl+F7"
        "Meta+F7"
      ];
      kwin.ExposeClassCurrentDesktop = [ ];
      kwin."Grid View" = "Meta+G";
      kwin."Increase Opacity" = [ ];
      kwin."Kill Window" = "Meta+Ctrl+Esc";
      kwin."Move Tablet to Next LogicalOutput" = [ ];
      kwin.MoveMouseToCenter = "Meta+F6";
      kwin.MoveMouseToFocus = "Meta+F5";
      kwin.MoveZoomDown = [ ];
      kwin.MoveZoomLeft = [ ];
      kwin.MoveZoomRight = [ ];
      kwin.MoveZoomUp = [ ];
      kwin.Overview = "Meta+W";
      kwin.PoloniumActivateAbove = "Alt+K";
      kwin.PoloniumActivateBelow = "Alt+J";
      kwin.PoloniumActivateLeft = "Alt+H";
      kwin.PoloniumActivateRight = "Alt+L";
      kwin.PoloniumCycleEngine = "Meta+|";
      kwin.PoloniumPlaceAbove = "Meta+Shift+K";
      kwin.PoloniumPlaceBelow = "Meta+Shift+J";
      kwin.PoloniumPlaceLeft = "Meta+Shift+H";
      kwin.PoloniumPlaceRight = "Meta+Shift+L";
      kwin.PoloniumResizeDown = "Meta+Ctrl+J";
      kwin.PoloniumResizeLeft = "Meta+Ctrl+H";
      kwin.PoloniumResizeRight = "Meta+Ctrl+L";
      kwin.PoloniumResizeUp = "Meta+Ctrl+K";
      kwin.PoloniumSetEngineBTree = [ ];
      kwin.PoloniumSetEngineHalf = [ ];
      kwin.PoloniumSetEngineKWin = [ ];
      kwin.PoloniumSetEnginePager = [ ];
      kwin.PoloniumSetEnginePillars = [ ];
      kwin.PoloniumSetEngineThreeColumn = [ ];
      kwin.PoloniumToggleActiveTiling = "Meta+Shift+Space";
      kwin.PoloniumToggleSettingsMenu = "Meta+\\\\,none";
      kwin."Setup Window Shortcut" = [ ];
      kwin."Show Desktop" = "Meta+D";
      kwin."Switch One Desktop Down" = "Meta+Ctrl+Down";
      kwin."Switch One Desktop Up" = "Meta+Ctrl+Up";
      kwin."Switch One Desktop to the Left" = "Meta+Ctrl+Left";
      kwin."Switch One Desktop to the Right" = "Meta+Ctrl+Right";
      kwin."Switch Window Down" = "Meta+Alt+Down";
      kwin."Switch Window Left" = "Meta+Alt+Left";
      kwin."Switch Window Right" = "Meta+Alt+Right";
      kwin."Switch Window Up" = "Meta+Alt+Up";
      kwin."Switch to Desktop 1" = "Alt+1";
      kwin."Switch to Desktop 10" = [ ];
      kwin."Switch to Desktop 11" = [ ];
      kwin."Switch to Desktop 12" = [ ];
      kwin."Switch to Desktop 13" = [ ];
      kwin."Switch to Desktop 14" = [ ];
      kwin."Switch to Desktop 15" = [ ];
      kwin."Switch to Desktop 16" = [ ];
      kwin."Switch to Desktop 17" = [ ];
      kwin."Switch to Desktop 18" = [ ];
      kwin."Switch to Desktop 19" = [ ];
      kwin."Switch to Desktop 2" = "Alt+2";
      kwin."Switch to Desktop 20" = [ ];
      kwin."Switch to Desktop 21" = [ ];
      kwin."Switch to Desktop 22" = [ ];
      kwin."Switch to Desktop 23" = [ ];
      kwin."Switch to Desktop 24" = [ ];
      kwin."Switch to Desktop 25" = [ ];
      kwin."Switch to Desktop 3" = "Alt+3";
      kwin."Switch to Desktop 4" = "Alt+4";
      kwin."Switch to Desktop 5" = "Alt+5";
      kwin."Switch to Desktop 6" = [ ];
      kwin."Switch to Desktop 7" = [ ];
      kwin."Switch to Desktop 8" = [ ];
      kwin."Switch to Desktop 9" = [ ];
      kwin."Switch to Next Desktop" = [ ];
      kwin."Switch to Next Screen" = [ ];
      kwin."Switch to Previous Desktop" = [ ];
      kwin."Switch to Previous Screen" = [ ];
      kwin."Switch to Screen 0" = [ ];
      kwin."Switch to Screen 1" = [ ];
      kwin."Switch to Screen 2" = [ ];
      kwin."Switch to Screen 3" = [ ];
      kwin."Switch to Screen 4" = [ ];
      kwin."Switch to Screen 5" = [ ];
      kwin."Switch to Screen 6" = [ ];
      kwin."Switch to Screen 7" = [ ];
      kwin."Switch to Screen Above" = [ ];
      kwin."Switch to Screen Below" = [ ];
      kwin."Switch to Screen to the Left" = [ ];
      kwin."Switch to Screen to the Right" = [ ];
      kwin."Toggle Night Color" = [ ];
      kwin."Toggle Window Raise/Lower" = [ ];
      kwin."Walk Through Windows" = [
        "Alt+Tab"
        "Meta+Tab"
      ];
      kwin."Walk Through Windows (Reverse)" = [
        "Alt+Shift+Tab"
        "Meta+Shift+Tab"
      ];
      kwin."Walk Through Windows Alternative" = [ ];
      kwin."Walk Through Windows Alternative (Reverse)" = [ ];
      kwin."Walk Through Windows of Current Application" = [
        "Alt+`"
        "Meta+`"
      ];
      kwin."Walk Through Windows of Current Application (Reverse)" = [
        "Alt+~"
        "Meta+~"
      ];
      kwin."Walk Through Windows of Current Application Alternative" = [ ];
      kwin."Walk Through Windows of Current Application Alternative (Reverse)" = [ ];
      kwin."Window Above Other Windows" = [ ];
      kwin."Window Below Other Windows" = [ ];
      kwin."Window Close" = "Alt+W";
      kwin."Window Custom Quick Tile Bottom" = [ ];
      kwin."Window Custom Quick Tile Left" = [ ];
      kwin."Window Custom Quick Tile Right" = [ ];
      kwin."Window Custom Quick Tile Top" = [ ];
      kwin."Window Fullscreen" = "Ctrl+Alt+F";
      kwin."Window Grow Horizontal" = [ ];
      kwin."Window Grow Vertical" = [ ];
      kwin."Window Lower" = [ ];
      kwin."Window Maximize" = "Alt+F";
      kwin."Window Maximize Horizontal" = [ ];
      kwin."Window Maximize Vertical" = [ ];
      kwin."Window Minimize" = "Meta+PgDown";
      kwin."Window Move" = [ ];
      kwin."Window Move Center" = [ ];
      kwin."Window No Border" = [ ];
      kwin."Window On All Desktops" = [ ];
      kwin."Window One Desktop Down" = "Meta+Ctrl+Shift+Down";
      kwin."Window One Desktop Up" = "Meta+Ctrl+Shift+Up";
      kwin."Window One Desktop to the Left" = "Meta+Ctrl+Shift+Left";
      kwin."Window One Desktop to the Right" = "Meta+Ctrl+Shift+Right";
      kwin."Window One Screen Down" = [ ];
      kwin."Window One Screen Up" = [ ];
      kwin."Window One Screen to the Left" = [ ];
      kwin."Window One Screen to the Right" = [ ];
      kwin."Window Operations Menu" = "Alt+F3";
      kwin."Window Pack Down" = [ ];
      kwin."Window Pack Left" = [ ];
      kwin."Window Pack Right" = [ ];
      kwin."Window Pack Up" = [ ];
      kwin."Window Quick Tile Bottom" = "Alt+Shift+J";
      kwin."Window Quick Tile Bottom Left" = [ ];
      kwin."Window Quick Tile Bottom Right" = [ ];
      kwin."Window Quick Tile Left" = "Alt+Shift+H";
      kwin."Window Quick Tile Right" = "Alt+Shift+L";
      kwin."Window Quick Tile Top" = "Alt+Shift+K";
      kwin."Window Quick Tile Top Left" = [ ];
      kwin."Window Quick Tile Top Right" = [ ];
      kwin."Window Raise" = [ ];
      kwin."Window Resize" = [ ];
      kwin."Window Restore" = "Meta+Backspace";
      kwin."Window Shrink Horizontal" = [ ];
      kwin."Window Shrink Vertical" = [ ];
      kwin."Window to Desktop 1" = "Alt+!";
      kwin."Window to Desktop 10" = [ ];
      kwin."Window to Desktop 11" = [ ];
      kwin."Window to Desktop 12" = [ ];
      kwin."Window to Desktop 13" = [ ];
      kwin."Window to Desktop 14" = [ ];
      kwin."Window to Desktop 15" = [ ];
      kwin."Window to Desktop 16" = [ ];
      kwin."Window to Desktop 17" = [ ];
      kwin."Window to Desktop 18" = [ ];
      kwin."Window to Desktop 19" = [ ];
      kwin."Window to Desktop 2" = "Alt+@";
      kwin."Window to Desktop 20" = [ ];
      kwin."Window to Desktop 21" = [ ];
      kwin."Window to Desktop 22" = [ ];
      kwin."Window to Desktop 23" = [ ];
      kwin."Window to Desktop 24" = [ ];
      kwin."Window to Desktop 25" = [ ];
      kwin."Window to Desktop 3" = "Alt+#";
      kwin."Window to Desktop 4" = "Alt+$";
      kwin."Window to Desktop 5" = "Alt+%";
      kwin."Window to Desktop 6" = [ ];
      kwin."Window to Desktop 7" = [ ];
      kwin."Window to Desktop 8" = [ ];
      kwin."Window to Desktop 9" = [ ];
      kwin."Window to Next Desktop" = [ ];
      kwin."Window to Next Screen" = "Meta+Shift+Right";
      kwin."Window to Previous Desktop" = [ ];
      kwin."Window to Previous Screen" = "Meta+Shift+Left";
      kwin."Window to Screen 0" = [ ];
      kwin."Window to Screen 1" = [ ];
      kwin."Window to Screen 2" = [ ];
      kwin."Window to Screen 3" = [ ];
      kwin."Window to Screen 4" = [ ];
      kwin."Window to Screen 5" = [ ];
      kwin."Window to Screen 6" = [ ];
      kwin."Window to Screen 7" = [ ];
      kwin.disableInputCapture = "Meta+Shift+Esc";
      kwin.view_actual_size = "Meta+0";
      kwin.view_zoom_in = [
        "Meta++"
        "Meta+="
      ];
      kwin.view_zoom_out = "Meta+-";
      mediacontrol.mediavolumedown = [ ];
      mediacontrol.mediavolumeup = [ ];
      mediacontrol.nextmedia = "Media Next";
      mediacontrol.pausemedia = "Media Pause";
      mediacontrol.playmedia = [ ];
      mediacontrol.playpausemedia = "Media Play";
      mediacontrol.previousmedia = "Media Previous";
      mediacontrol.seekbackwardmedia = "Media Rewind";
      mediacontrol.seekbackwardmedialong = [ ];
      mediacontrol.seekforwardmedia = "Media Fast Forward";
      mediacontrol.seekforwardmedialong = [ ];
      mediacontrol.stopmedia = "Media Stop";
      org_kde_powerdevil."Decrease Keyboard Brightness" = "Keyboard Brightness Down";
      org_kde_powerdevil."Decrease Screen Brightness" = "Monitor Brightness Down";
      org_kde_powerdevil."Decrease Screen Brightness Small" = "Shift+Monitor Brightness Down";
      org_kde_powerdevil.Hibernate = "Hibernate";
      org_kde_powerdevil."Increase Keyboard Brightness" = "Keyboard Brightness Up";
      org_kde_powerdevil."Increase Screen Brightness" = "Monitor Brightness Up";
      org_kde_powerdevil."Increase Screen Brightness Small" = "Shift+Monitor Brightness Up";
      org_kde_powerdevil.PowerDown = "Power Down";
      org_kde_powerdevil.PowerOff = "Power Off";
      org_kde_powerdevil.Sleep = "Sleep";
      org_kde_powerdevil."Toggle Keyboard Backlight" = "Keyboard Light On/Off";
      org_kde_powerdevil."Turn Off Screen" = [ ];
      org_kde_powerdevil.powerProfile = [
        "Battery"
        "Meta+B"
      ];
      plasmashell."Slideshow Wallpaper Next Image" = [ ];
      plasmashell."activate application launcher" = [
        "Meta"
        "Alt+F1"
      ];
      plasmashell."activate task manager entry 1" = "Meta+1";
      plasmashell."activate task manager entry 10" = [ ];
      plasmashell."activate task manager entry 2" = "Meta+2";
      plasmashell."activate task manager entry 3" = "Meta+3";
      plasmashell."activate task manager entry 4" = "Meta+4";
      plasmashell."activate task manager entry 5" = "Meta+5";
      plasmashell."activate task manager entry 6" = "Meta+6";
      plasmashell."activate task manager entry 7" = "Meta+7";
      plasmashell."activate task manager entry 8" = "Meta+8";
      plasmashell."activate task manager entry 9" = "Meta+9";
      plasmashell."clear history" = [ ];
      plasmashell.clear-history = [ ];
      plasmashell.clipboard_action = "Meta+Ctrl+X";
      plasmashell.cycle-panels = "Meta+Alt+P";
      plasmashell.cycleNextAction = [ ];
      plasmashell.cyclePrevAction = [ ];
      plasmashell.edit_clipboard = [ ];
      plasmashell."manage activities" = "Meta+Q";
      plasmashell."next activity" = "Meta+A";
      plasmashell."previous activity" = "Meta+Shift+A";
      plasmashell.repeat_action = [ ];
      plasmashell."show dashboard" = "Ctrl+F12";
      plasmashell.show-barcode = [ ];
      plasmashell.show-on-mouse-pos = "Meta+V";
      plasmashell."switch to next activity" = [ ];
      plasmashell."switch to previous activity" = [ ];
      plasmashell."toggle do not disturb" = [ ];
      "services/net.local.alacritty.desktop"._launch = "Alt+Space";
      "services/org.kde.krunner.desktop"._launch = [
        "Search"
        "Alt+F2"
      ];
    };
    configFile = {
      baloofilerc.General.dbVersion = 2;
      kactivitymanagerdrc.activities."08633b98-a783-47e0-ad36-4919228cc9f8" = "Default";
      kcminputrc.Keyboard.RepeatDelay = 500;
      kcminputrc.Keyboard.RepeatRate = 60;
      kcminputrc."Libinput/1267/12780/ELAN07A8:00 04F3:31EC Touchpad".Enabled = true;
      kcminputrc."Libinput/1267/12780/ELAN07A8:00 04F3:31EC Touchpad".NaturalScroll = true;
      kded5rc.Module-device_automounter.autoload = false;
      kdeglobals.KDE.AnimationDurationFactor = 0;
      kdeglobals.KDE.contrast = 4;
      kdeglobals.KDE.frameContrast = 0.2;
      kdeglobals.WM.activeBackground = "39,44,49";
      kdeglobals.WM.activeBlend = "252,252,252";
      kdeglobals.WM.activeForeground = "252,252,252";
      kdeglobals.WM.inactiveBackground = "32,36,40";
      kdeglobals.WM.inactiveBlend = "161,169,177";
      kdeglobals.WM.inactiveForeground = "161,169,177";
      kuriikwsfilterrc.General.EnableWebShortcuts = true;
      kuriikwsfilterrc.General.KeywordDelimiter = ":";
      kuriikwsfilterrc.General.PreferredWebShortcuts = "";
      kuriikwsfilterrc.General.UsePreferredWebShortcutsOnly = false;
      kwalletrc.Wallet."First Use" = false;
      kwinrc.Desktops.Id_1 = "81cb106c-3902-4a46-83d4-afd31972f204";
      kwinrc.Desktops.Id_2 = "7e869149-ea24-487b-860b-c529508039d1";
      kwinrc.Desktops.Id_3 = "32237f0e-10e5-45f0-a315-22f31e01036d";
      kwinrc.Desktops.Id_4 = "fbdea03c-6572-4fed-823d-0e04a72b6653";
      kwinrc.Desktops.Id_5 = "d513fc61-cb90-4ac1-947c-c4dce1bd5804";
      kwinrc.Desktops.Name_1 = 1;
      kwinrc.Desktops.Name_2 = 2;
      kwinrc.Desktops.Name_3 = 3;
      kwinrc.Desktops.Name_4 = 4;
      kwinrc.Desktops.Name_5 = 5;
      kwinrc.Desktops.Number = 5;
      kwinrc.Desktops.Rows = 1;
      kwinrc.Plugins.poloniumEnabled = true;
      kwinrc.Script-polonium.Borders = 2;
      kwinrc.Script-polonium.EngineType = 0;
      kwinrc.Script-polonium.MaximizeSingle = true;
      kwinrc."Tiling/32237f0e-10e5-45f0-a315-22f31e01036d/eb67f5ed-491f-44dc-a2f2-fae0c60a6df0".padding =
        4;
      kwinrc."Tiling/32237f0e-10e5-45f0-a315-22f31e01036d/eb67f5ed-491f-44dc-a2f2-fae0c60a6df0".tiles =
        "{\"layoutDirection\":\"horizontal\",\"tiles\":[]}";
      kwinrc."Tiling/551443ec-caea-4450-8e0c-d93c30c454c3/eb67f5ed-491f-44dc-a2f2-fae0c60a6df0".padding =
        4;
      kwinrc."Tiling/551443ec-caea-4450-8e0c-d93c30c454c3/eb67f5ed-491f-44dc-a2f2-fae0c60a6df0".tiles =
        "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
      kwinrc."Tiling/7e869149-ea24-487b-860b-c529508039d1/eb67f5ed-491f-44dc-a2f2-fae0c60a6df0".padding =
        4;
      kwinrc."Tiling/7e869149-ea24-487b-860b-c529508039d1/eb67f5ed-491f-44dc-a2f2-fae0c60a6df0".tiles =
        "{\"layoutDirection\":\"horizontal\",\"tiles\":[]}";
      kwinrc."Tiling/81cb106c-3902-4a46-83d4-afd31972f204/eb67f5ed-491f-44dc-a2f2-fae0c60a6df0".padding =
        4;
      kwinrc."Tiling/81cb106c-3902-4a46-83d4-afd31972f204/eb67f5ed-491f-44dc-a2f2-fae0c60a6df0".tiles =
        "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"layoutDirection\":\"vertical\",\"tiles\":[{\"height\":0.5},{\"height\":0.5}],\"width\":0.5},{\"width\":0.5}]}";
      kwinrc."Tiling/d513fc61-cb90-4ac1-947c-c4dce1bd5804/eb67f5ed-491f-44dc-a2f2-fae0c60a6df0".padding =
        4;
      kwinrc."Tiling/d513fc61-cb90-4ac1-947c-c4dce1bd5804/eb67f5ed-491f-44dc-a2f2-fae0c60a6df0".tiles =
        "{\"layoutDirection\":\"horizontal\",\"tiles\":[]}";
      kwinrc."Tiling/fbdea03c-6572-4fed-823d-0e04a72b6653/eb67f5ed-491f-44dc-a2f2-fae0c60a6df0".padding =
        4;
      kwinrc."Tiling/fbdea03c-6572-4fed-823d-0e04a72b6653/eb67f5ed-491f-44dc-a2f2-fae0c60a6df0".tiles =
        "{\"layoutDirection\":\"horizontal\",\"tiles\":[]}";
      kwinrc.Windows.DelayFocusInterval = 0;
      kwinrc.Windows.FocusPolicy = "FocusFollowsMouse";
      kwinrc.Windows.PerOutputVirtualDesktops = true;
      kwinrc.Xwayland.Scale = 1;
      kwinrc."org.kde.kdecoration2".theme = "Breeze Dark";
      kwinrulesrc.General.rules = "";
      plasma-localerc.Formats.LANG = "en_US.UTF-8";
      spectaclerc.ImageSave.translatedScreenshotsFolder = "Screenshots";
      spectaclerc.VideoSave.translatedScreencastsFolder = "Screencasts";
    };
    dataFile = {

    };
  };
}
