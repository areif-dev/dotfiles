# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./docker-compose.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;

  # Use the systemd-boot EFI boot loader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    swraid.enable = true;
    kernelPackages = pkgs.linuxPackages_latest;
  };

  networking.hostName = "nas"; # Define your hostname.
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

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable network printer discovery
  # services.avahi = {
  #   enable = true;
  #   nssmdns4 = true; 
  #   openFirewall = true;
  # };

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
    linger = true;
    packages = with pkgs; [
      hledger
      mullvad-vpn
      ripgrep
      starship
      syncthing
      viu
    ];
  };

  users.users.root.hashedPassword = "!";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    bc
    beets 
    gcc
    git
    htop
    killall
    libgcc
    neovim
    plocate
    podman-compose
    python3
    rclone
    unzip
    virtiofsd
    wget
    yt-dlp
    zip
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  systemd = {
    timers = {
      "backup" = {
        description = "Daily backup of critical data to S3";
        wantedBy = [ "timers.target" ];
        timerConfig = {
          OnCalendar = "*-*-* 04:00:00";
          Persistent = true;
          Unit = "backup.service";
        };
      };
    };

    services = {
      "backup" = {
        wants = [ "network-online.target" ];
        script = ''
          set -eu 

          ${pkgs.rclone}/bin/rclone sync /mnt/bulk/audiobooks/ remote:areif-dev-nas-backup/audiobooks
          ${pkgs.rclone}/bin/rclone sync /mnt/bulk/images/ remote:areif-dev-nas-backup/images 
          ${pkgs.rclone}/bin/rclone sync /mnt/bulk/music/ remote:areif-dev-nas-backup/music 
          ${pkgs.rclone}/bin/rclone sync /mnt/bulk/podcasts/ remote:areif-dev-nas-backup/podcasts 
          ${pkgs.rclone}/bin/rclone sync /mnt/bulk/postgres/ remote:areif-dev-nas-backup/postgres 
          ${pkgs.rclone}/bin/rclone sync /mnt/bulk/syncthing/ remote:areif-dev-nas-backup/syncthing --exclude *.kdbx
          ${pkgs.rclone}/bin/rclone sync /home/aj/.config/postgres remote:areif-dev-nas-backup/.config/postgres
          ${pkgs.rclone}/bin/rclone sync /home/aj/.config/jellyfin remote:areif-dev-nas-backup/.config/jellyfin
          ${pkgs.rclone}/bin/rclone sync /home/aj/.config/navidrome remote:areif-dev-nas-backup/.config/navidrome
          ${pkgs.rclone}/bin/rclone sync /home/aj/.config/audiobookshelf remote:areif-dev-nas-backup/.config/audiobookshelf
          ${pkgs.rclone}/bin/rclone sync /home/aj/.cache/audiobookshelf remote:areif-dev-nas-backup/.cache/audiobookshelf
          ${pkgs.rclone}/bin/rclone sync /home/aj/.cache/jellyfin remote:areif-dev-nas-backup/.cache/jellyfin
        '';
        description = "Backup critical data from raid array to S3";
        after = [ "network-online.target" ];
        serviceConfig = {
          Type = "oneshot";
        };
      };
    };
  };

  programs = {
    zsh = {
      enable = true; 
      ohMyZsh.enable = true; 
      autosuggestions.enable = true;
    };

    virt-manager.enable = true;
  };

  # Enable the OpenSSH daemon.
  services = {
    locate = {
      package = pkgs.plocate;
      enable = true;
      localuser = null;
    };

    openssh.enable = true;
    tailscale.enable = true;
  };

  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      defaultNetwork.settings.dns_enabled = true;
    };
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
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
