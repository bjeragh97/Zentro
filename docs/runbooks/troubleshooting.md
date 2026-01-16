# Runbook: Troubleshooting

Purpose: Common failures and fast fixes.

## Commands
```bash
# Check Postgres
pg_isready

# Check current env
env | rg DATABASE_URL

# Check server health
curl http://127.0.0.1:8000/health
```

## Symptoms and fixes
| Symptom | Likely cause | Fix |
| --- | --- | --- |
| `psycopg.OperationalError` | Postgres not running | Start Postgres with `brew services start postgresql@14` |
| 500 on create | Migration not applied | Run `alembic upgrade head` |
| `ModuleNotFoundError: app` | Wrong app-dir | Use `uvicorn app.main:app --app-dir api` |

## Checklist
- [ ] Virtualenv active
- [ ] Dependencies installed
- [ ] DB running and reachable
- [ ] Migrations applied
