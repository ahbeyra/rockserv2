# Docker quickstart

Build and run the full stack (MariaDB + game + web UI):

```
docker compose -f docker-compose.yml -f docker-compose.web.yml up -d --build
```

Or use the helper script (recommended):

```
scripts/setup.sh
```

To run fuzzem instead:

```
ROCKSERV_GAME=fuzzem docker compose -f docker-compose.yml -f docker-compose.web.yml up -d --build
```

The server listens on ports 4000 (telnet) and 2331 (web). Data is persisted in `./data/<game>/`.

The web UI is available on port 8080.
If you're using Postgres, set `ROCKSERV_DB_DRIVER=pg` and `ROCKSERV_DB_PORT=5432`.

## Postgres (optional)

```
docker compose -f docker-compose.yml -f docker-compose.postgres.yml up -d --build
```

This uses `r2_schema_data.pg.sql`, generated from `r2_schema_data.sql`.

## Datadog agent (optional)

```
DD_API_KEY=... docker compose -f docker-compose.yml -f docker-compose.monitoring.yml up -d
```

## Hardening

Host-level firewall and fail2ban guidance is in `docs/hardening.md`.
