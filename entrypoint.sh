#!/bin/sh
# Docker entrypoint script.

# Wait until Postgres is ready
while ! pg_isready -q -h $PG_HOST -p $PG_PORT -U $PG_USERNAME
do
  echo "$(date) - waiting for database to start"
  sleep 2
done

# Create, migrate, and seed database if it doesn't exist.
if [[ -z `psql -Atqc "\\list $PG_DATABASE"` ]]; then
  echo "Database $PG_DATABASE does not exist. Creating..."
  source .env
  createdb -E UTF8 $PG_DATABASE -l en_US.UTF-8 -T template0
  mix ecto.migrate
  mix run priv/repo/seeds.exs
  echo "Database $PG_DATABASE created."
fi

exec mix phx.server