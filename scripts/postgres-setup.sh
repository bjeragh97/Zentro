#!/usr/bin/env bash
set -euo pipefail

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is not installed."
  echo "Install it from: https://brew.sh"
  exit 1
fi

if ! command -v psql >/dev/null 2>&1; then
  echo "psql not found. Install PostgreSQL first:"
  echo "./scripts/brew-setup.sh"
  exit 1
fi

echo "Starting PostgreSQL service..."
if ! brew services start postgresql@16; then
  echo "brew services start failed; attempting direct pg_ctl start..."
  if command -v pg_ctl >/dev/null 2>&1; then
    pg_ctl -D /usr/local/var/postgresql@16 start
  else
    echo "pg_ctl not found. Ensure postgresql@16 is installed and on PATH."
    exit 1
  fi
fi

if ! pg_isready >/dev/null 2>&1; then
  echo "Postgres is not responding. Check launchctl or pg_ctl logs."
  exit 1
fi

ROLE_EXISTS=$(psql -d postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname='zentro'" || true)
if [[ "$ROLE_EXISTS" != "1" ]]; then
  echo "Creating role 'zentro'..."
  psql -d postgres -v ON_ERROR_STOP=1 -c "CREATE ROLE zentro WITH LOGIN PASSWORD 'zentro';"
else
  echo "Role 'zentro' already exists"
fi

DB_EXISTS=$(psql -d postgres -tAc "SELECT 1 FROM pg_database WHERE datname='zentro'" || true)
if [[ "$DB_EXISTS" != "1" ]]; then
  echo "Creating database 'zentro'..."
  psql -d postgres -v ON_ERROR_STOP=1 -c "CREATE DATABASE zentro OWNER zentro;"
else
  echo "Database 'zentro' already exists"
fi

echo "Granting privileges..."
psql -d postgres -v ON_ERROR_STOP=1 -c "GRANT ALL PRIVILEGES ON DATABASE zentro TO zentro;"

echo "Example DATABASE_URL (asyncpg):"
echo "postgresql+asyncpg://zentro:zentro@localhost:5432/zentro"
