# Auto-generated using compose2nix v0.3.1.
{ pkgs, lib, ... }:

let 
  secrets = builtins.fromJSON (builtins.readFile "/etc/nixos/hosts/nas/secrets.json");
in
{
  # Runtime
  virtualisation.podman = {
    enable = true;
    autoPrune.enable = true;
    dockerCompat = true;
    defaultNetwork.settings = {
      # Required for container networking to be able to use names.
      dns_enabled = true;
    };
  };

  # Enable container name DNS for non-default Podman networks.
  # https://github.com/NixOS/nixpkgs/issues/226365
  networking.firewall.interfaces."podman+".allowedUDPPorts = [ 53 ];

  virtualisation.oci-containers.backend = "podman";

  # Containers
  virtualisation.oci-containers.containers."immich_machine_learning" = {
    image = "ghcr.io/immich-app/immich-machine-learning:release";
    environment = {
      "DB_DATABASE_NAME" = "immich";
      "DB_DATA_LOCATION" = "/mnt/bulk/postgres";
      "DB_PASSWORD" = secrets.immich.db_password;
      "DB_USERNAME" = "postgres";
      "IMMICH_VERSION" = "release";
      "UPLOAD_LOCATION" = "/mnt/bulk/images";
    };
    volumes = [
      "services_model-cache:/cache:rw"
    ];
    log-driver = "journald";
    extraOptions = [
      "--network-alias=immich-machine-learning"
      "--network=services_default"
    ];
  };
  systemd.services."podman-immich_machine_learning" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "always";
    };
    after = [
      "podman-network-services_default.service"
      "podman-volume-services_model-cache.service"
    ];
    requires = [
      "podman-network-services_default.service"
      "podman-volume-services_model-cache.service"
    ];
    partOf = [
      "podman-compose-services-root.target"
    ];
    wantedBy = [
      "podman-compose-services-root.target"
    ];
  };
  virtualisation.oci-containers.containers."immich_postgres" = {
    image = "docker.io/tensorchord/pgvecto-rs:pg14-v0.2.0";
    environment = {
      "POSTGRES_DB" = "immich";
      "POSTGRES_INITDB_ARGS" = "--data-checksums";
      "POSTGRES_PASSWORD" = secrets.immich.db_password;
      "POSTGRES_USER" = "postgres";
    };
    volumes = [
      "/mnt/bulk/postgres:/var/lib/postgresql/data:rw,z"
    ];
    cmd = [ "postgres" "-c" "shared_preload_libraries=vectors.so" "-c" "search_path=\"$user\", public, vectors" "-c" "logging_collector=on" "-c" "max_wal_size=2GB" "-c" "shared_buffers=512MB" "-c" "wal_compression=on" ];
    log-driver = "journald";
    extraOptions = [
      "--health-cmd=pg_isready --dbname=\"\${POSTGRES_DB}\" --username=\"\${POSTGRES_USER}\" || exit 1; Chksum=\"$(psql --dbname=\"\${POSTGRES_DB}\" --username=\"\${POSTGRES_USER}\" --tuples-only --no-align --command='SELECT COALESCE(SUM(checksum_failures), 0) FROM pg_stat_database')\"; echo \"checksum failure count is $Chksum\"; [ \"$Chksum\" = '0' ] || exit 1"
      "--health-interval=5m0s"
      "--health-start-period=5m0s"
      "--health-startup-interval=30s"
      "--network-alias=database"
      "--network=services_default"
    ];
  };
  systemd.services."podman-immich_postgres" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "always";
    };
    after = [
      "podman-network-services_default.service"
    ];
    requires = [
      "podman-network-services_default.service"
    ];
    partOf = [
      "podman-compose-services-root.target"
    ];
    wantedBy = [
      "podman-compose-services-root.target"
    ];
  };
  virtualisation.oci-containers.containers."immich_redis" = {
    image = "docker.io/redis:6.2-alpine";
    log-driver = "journald";
    extraOptions = [
      "--health-cmd=redis-cli ping || exit 1"
      "--network-alias=redis"
      "--network=services_default"
    ];
  };
  systemd.services."podman-immich_redis" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "always";
    };
    after = [
      "podman-network-services_default.service"
    ];
    requires = [
      "podman-network-services_default.service"
    ];
    partOf = [
      "podman-compose-services-root.target"
    ];
    wantedBy = [
      "podman-compose-services-root.target"
    ];
  };
  virtualisation.oci-containers.containers."immich_server" = {
    image = "ghcr.io/immich-app/immich-server:release";
    environment = {
      "DB_DATABASE_NAME" = "immich";
      "DB_DATA_LOCATION" = "/mnt/bulk/postgres";
      "DB_PASSWORD" = secrets.immich.db_password;
      "DB_USERNAME" = "postgres";
      "IMMICH_VERSION" = "release";
      "UPLOAD_LOCATION" = "/mnt/bulk/images";
    };
    volumes = [
      "/etc/localtime:/etc/localtime:ro"
      "/mnt/bulk/images:/usr/src/app/upload:rw,z"
    ];
    ports = [
      "2283:2283/tcp"
    ];
    dependsOn = [
      "immich_postgres"
      "immich_redis"
    ];
    log-driver = "journald";
    extraOptions = [
      "--network-alias=immich-server"
      "--network=services_default"
    ];
  };
  systemd.services."podman-immich_server" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "always";
    };
    after = [
      "podman-network-services_default.service"
    ];
    requires = [
      "podman-network-services_default.service"
    ];
    partOf = [
      "podman-compose-services-root.target"
    ];
    wantedBy = [
      "podman-compose-services-root.target"
    ];
  };
  virtualisation.oci-containers.containers."jellyfin" = {
    image = "docker.io/jellyfin/jellyfin:latest";
    volumes = [
      "/home/aj/.cache/jellyfin:/cache:rw,z"
      "/home/aj/.config/jellyfin:/config:rw,z"
      "/mnt/bulk/movies:/movies:rw,z"
      "/mnt/bulk/music:/music:rw,z"
      "/mnt/bulk/shows:/shows:rw,z"
    ];
    ports = [
      "8096:8096/tcp"
    ];
    log-driver = "journald";
    extraOptions = [
      "--network-alias=jellyfin"
      "--network=services_default"
    ];
  };
  systemd.services."podman-jellyfin" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "always";
    };
    after = [
      "podman-network-services_default.service"
    ];
    requires = [
      "podman-network-services_default.service"
    ];
    partOf = [
      "podman-compose-services-root.target"
    ];
    wantedBy = [
      "podman-compose-services-root.target"
    ];
  };
  virtualisation.oci-containers.containers."services-audiobookshelf" = {
    image = "ghcr.io/advplyr/audiobookshelf:latest";
    environment = {
      "TZ" = "America/New_York";
    };
    volumes = [
      "/home/aj/.cache/audiobookshelf:/metadata:rw,z"
      "/home/aj/.config/audiobookshelf:/config:rw,z"
      "/mnt/bulk/audiobooks:/audiobooks:rw,z"
      "/mnt/bulk/podcasts:/podcasts:rw,z"
    ];
    ports = [
      "13378:80/tcp"
    ];
    log-driver = "journald";
    extraOptions = [
      "--network-alias=audiobookshelf"
      "--network=services_default"
    ];
  };
  systemd.services."podman-services-audiobookshelf" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "no";
    };
    after = [
      "podman-network-services_default.service"
    ];
    requires = [
      "podman-network-services_default.service"
    ];
    partOf = [
      "podman-compose-services-root.target"
    ];
    wantedBy = [
      "podman-compose-services-root.target"
    ];
  };
  virtualisation.oci-containers.containers."syncthing" = {
    image = "docker.io/syncthing/syncthing";
    environment = {
      "PGID" = "1000";
      "PUID" = "1000";
    };
    volumes = [
      "/mnt/bulk/syncthing:/var/syncthing:rw,z"
    ];
    log-driver = "journald";
    extraOptions = [
      "--health-cmd=curl -fkLsS -m 2 127.0.0.1:8384/rest/noauth/health | grep -o --color=never OK || exit 1"
      "--health-interval=1m0s"
      "--health-retries=3"
      "--health-timeout=10s"
      "--network=host"
    ];
  };
  systemd.services."podman-syncthing" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "always";
    };
    partOf = [
      "podman-compose-services-root.target"
    ];
    wantedBy = [
      "podman-compose-services-root.target"
    ];
  };

  # Networks
  systemd.services."podman-network-services_default" = {
    path = [ pkgs.podman ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStop = "podman network rm -f services_default";
    };
    script = ''
      podman network inspect services_default || podman network create services_default
    '';
    partOf = [ "podman-compose-services-root.target" ];
    wantedBy = [ "podman-compose-services-root.target" ];
  };

  # Volumes
  systemd.services."podman-volume-services_model-cache" = {
    path = [ pkgs.podman ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      podman volume inspect services_model-cache || podman volume create services_model-cache
    '';
    partOf = [ "podman-compose-services-root.target" ];
    wantedBy = [ "podman-compose-services-root.target" ];
  };

  # Root service
  # When started, this will automatically create all resources and start
  # the containers. When stopped, this will teardown all resources.
  systemd.targets."podman-compose-services-root" = {
    unitConfig = {
      Description = "Root target generated by compose2nix.";
    };
    wantedBy = [ "multi-user.target" ];
  };
}
