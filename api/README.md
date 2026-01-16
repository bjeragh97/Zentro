# Zentro API

## Migrations

- Generate a revision: `alembic revision --autogenerate -m "init"`
- Apply migrations: `alembic upgrade head`
- Roll back: `alembic downgrade -1`

Run commands from the `api` directory.
