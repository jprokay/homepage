{ pkgs, lib, config, inputs, ... }:

{
  # https://devenv.sh/basics/

  # https://devenv.sh/packages/
  packages = [ pkgs.git
    pkgs.corepack
    pkgs.prettierd
    pkgs.eslint_d
    pkgs.postgresql_16
    pkgs.dbmate
    pkgs.jq
    pkgs.openapi-generator-cli
  ];


  languages.typescript = {
    enable = true;
  };
  # https://devenv.sh/languages/
  # languages.rust.enable = true;

  # https://devenv.sh/processes/
  # processes.cargo-watch.exec = "cargo-watch";

  # https://devenv.sh/services/
  # services.postgres.enable = true;
  services.postgres = {
    enable = true;
    package = pkgs.postgresql_16;
    listen_addresses = "127.0.0.1";
    port = 5432;
    initialDatabases = [
      {
        name = "db";
      }
      {
        name = "testdb";
      }
      {
        name = "prefect";
      }
    ];
    initialScript = "
      CREATE USER postgres WITH SUPERUSER PASSWORD 'postgres';
    ";
    extensions = extensions: [
      extensions.pg_cron
    ];
    settings = {
      shared_preload_libraries = "pg_cron";
    };
  };

  env = {
    DATABASE_URL = "postgresql://postgres:postgres@127.0.0.1:5432/db?sslmode=disable";
    GATEWAY_PORT = "3000";
    JWT_SIGNING_SECRET = "CHANGE_ME_IN_PRODUCTION";
  };

  services.caddy = {
    enable = true;
    virtualHosts."app.local" = {
      extraConfig = ''
        # Automatic HTTPS with self-signed cert for local development
        tls internal

        handle /docs* {
          reverse_proxy localhost:3000
        }

        handle /mailpit* {
          reverse_proxy localhost:54324
        }

        # Proxy API requests to the gateway
        handle_path /api/* {
          reverse_proxy localhost:3000
        }

        # Serve the web app for all other requests
        handle {
          reverse_proxy localhost:5173
        }
      '';
    };
  };

  services.redis = {
    # https://devenv.sh/supported-services/redis/
    enable = true;
    port = 6379;
  };

  services.minio = {
    enable = true;

    accessKey = "minioadmin";
    browser = true;
    buckets = ["docs"];
    consoleAddress = "127.0.0.1:9001";
    listenAddress = "127.0.0.1:9000";
    secretKey = "miniadmin";
  };

  git-hooks.hooks = {
    build = {
      enable = true;
      name = "Build";
      entry = "pnpm build";
      pass_filenames = false;
      always_run = true;
      language = "node";
    };
    check = {
      enable = true;
      name = "Check";
      entry = "pnpm check";
      pass_filenames = false;
      always_run = true;
      language = "node";
    };
  };
  # Test runner scripts
  scripts.test-unit.exec = ''
    turbo run test:unit --filter=lit-web
  '';

  scripts.test-e2e.exec = ''
    turbo run test:e2e --filter=tests
  '';

  scripts.test-db.exec = ''
    turbo run test:db --filter=db
  '';

  scripts.test-all.exec = ''
    turbo run test:unit --filter=lit-web && turbo run test:db --filter=db && turbo run test:e2e --filter=tests
  '';
}
