# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes"  ];

  nixpkgs.config.allowUnfree = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "laptop"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "US/Eastern";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.aj = {
    isNormalUser = true;
    initialPassword = "changeme";
    extraGroups = [ "wheel" "libvirtd" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
    packages = with pkgs; [
      alacritty
      bluez
      bluez-tools
      discord-canary
      dunst
      firefox
      freetube
      gimp
      grim
      hledger
      keepassxc
      llama-cpp
      libreoffice-still
      librewolf
      localsend
      mullvad-vpn
      nodejs
      neovim
      nwg-look
      papirus-icon-theme
      pavucontrol
      phinger-cursors
      plocate
      remmina
      ripgrep
      rofi-wayland
      rustup
      starship
      steam-run
      swaybg
      swayidle
      swaylock
      syncthing
      tldr
      tor-browser
      transmission_4-gtk
      viu
      vlc
      webcord
      wl-clipboard
      wlr-randr
      youtube-music
    ];
  };

  # Disable root password login
  users.users.root.hashedPassword = "!";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    bc
    distrobox
    gcc
    git
    htop
    killall
    libgcc
    lxqt.lxqt-policykit
    neovim
    python3
    river-bsp-layout
    unzip
    virtiofsd
    wget
    zip
  ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  fonts.packages = with pkgs; [
    cascadia-code
    font-awesome
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  hardware.bluetooth.enable = true;

  programs = {
    river.enable = true;
    hyprland.enable = true;
    waybar.enable = true;

    zsh = {
      enable = true;
      ohMyZsh.enable = true; 
      autosuggestions.enable = true;
    };

    steam = {
      enable = true;
      remotePlay.openFirewall = false;
      dedicatedServer.openFirewall = false;
      gamescopeSession.enable = true;
    };

    thunar = {
      enable = true; 
      plugins = with pkgs.xfce; [
        thunar-archive-plugin 
        thunar-volman
      ];
    };

    thunderbird.enable = true;

    xfconf.enable = true; 

    virt-manager.enable = true;
  };

  # List services that you want to enable:
  services = {
    # Enable network printer discovery
    avahi = {
      enable = true;
      nssmdns4 = true; 
      openFirewall = true;
    };

    dbus.enable = true;

    fwupd.enable = true;

    gnome.gnome-keyring.enable = true;

    gvfs.enable = true;  # Enable mounting, trash, etc for Thunar

    locate = {
      package = pkgs.plocate;
      enable = true;
    };

    mullvad-vpn.enable = true;

    ollama = {
        enable = true;
        acceleration = false;  # No supported GPUs available on laptop
    };

    # Enable the OpenSSH daemon.
    openssh.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    }; 

    ratbagd.enable = true;

    # Enable CUPS to print documents.
    printing.enable = true;

    tailscale.enable = true;

    tumbler.enable = true;  # Thumbnail support for images 
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  virtualisation = {
    podman = {
      enable = true;
      defaultNetwork.settings.dns_enabled = true;
    };
    libvirtd.enable = true;
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?

}

