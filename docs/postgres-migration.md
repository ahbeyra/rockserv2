# Postgres migration notes

The repo ships with a MySQL-compatible dump in `r2_schema_data.sql`. To run with
Postgres, you will need to convert that schema (and any data you care about).

To run the Postgres stack:

```
docker compose -f docker-compose.yml -f docker-compose.postgres.yml up -d --build
```

## Suggested flow (pgloader)

1) Start two temporary containers on the same network:

```
docker network create rockserv2-migrate

docker run -d --name rs2-mysql --network rockserv2-migrate \
  -e MARIADB_ROOT_PASSWORD=rootpass \
  -v "$(pwd)/r2_schema_data.sql:/docker-entrypoint-initdb.d/01_schema.sql:ro" \
  mariadb:10.6

docker run -d --name rs2-pg --network rockserv2-migrate \
  -e POSTGRES_PASSWORD=pgpass \
  postgres:15
```

2) Run pgloader to migrate both databases:

```
docker run --rm --network rockserv2-migrate dimitri/pgloader:latest \
  pgloader mysql://root:rootpass@rs2-mysql/r2_dillfrog \
           postgresql://postgres:pgpass@rs2-pg/r2_dillfrog

docker run --rm --network rockserv2-migrate dimitri/pgloader:latest \
  pgloader mysql://root:rootpass@rs2-mysql/r2_fuzzem \
           postgresql://postgres:pgpass@rs2-pg/r2_fuzzem
```

3) Dump the Postgres schema to a file:

```
docker exec -t rs2-pg pg_dump -s -U postgres r2_dillfrog > r2_schema_data.pg.sql
docker exec -t rs2-pg pg_dump -s -U postgres r2_fuzzem >> r2_schema_data.pg.sql
```

4) Stop and clean up:

```
docker rm -f rs2-mysql rs2-pg
docker network rm rockserv2-migrate
```

The repo now includes `r2_schema_data.pg.sql`. Re-run these steps any time you
need to refresh the schema from a newer MySQL dump.
