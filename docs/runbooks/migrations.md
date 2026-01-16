# Runbook: Migrations

Purpose: Generate and apply schema migrations safely.

## Commands
```bash
cd api
alembic revision --autogenerate -m "message"
alembic upgrade head
```

## Symptoms and fixes
| Symptom | Likely cause | Fix |
| --- | --- | --- |
| Empty migration | Models not imported | Ensure `app.models` is imported in `alembic/env.py` |
| Wrong DB targeted | Misconfigured URL | Check `DATABASE_URL` and `alembic.ini` |
| Async errors | Alembic config mismatch | Confirm async engine in `env.py` |

## Checklist
- [ ] Local DB is running
- [ ] `DATABASE_URL` points to local DB
- [ ] Autogenerate diff reviewed
