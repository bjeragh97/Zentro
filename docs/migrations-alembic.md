# Migrations (Alembic)

Purpose: How to manage schema changes safely.

## Common commands
```bash
cd api
alembic revision --autogenerate -m "message"
alembic upgrade head
alembic downgrade -1
```

## Gotchas with async SQLAlchemy
- Alembic still runs sync migrations under the hood
- Ensure `app.models` are imported in `alembic/env.py`
- Always run migrations from the `api` directory

## Checklist before migration
- [ ] Models updated
- [ ] Local DB reachable
- [ ] `DATABASE_URL` points to local instance
- [ ] Autogenerate diff looks correct

## Rollback guidance
- Use `alembic downgrade -1` for last migration
- If data loss is possible, create manual downgrade steps
