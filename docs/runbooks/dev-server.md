# Runbook: Dev Server

Purpose: Start and verify the local FastAPI server.

## Commands
```bash
source .venv/bin/activate
uvicorn app.main:app --reload --app-dir api
```

## Symptoms and fixes
| Symptom | Likely cause | Fix |
| --- | --- | --- |
| Port in use | Another server running | `lsof -i :8000` then kill process |
| Import errors | Wrong working directory | Use `--app-dir api` |
| DB errors on startup | Invalid `DATABASE_URL` | Check `api/.env` and connection |

## Checklist
- [ ] Virtualenv active
- [ ] `.env` exists with correct `DATABASE_URL`
- [ ] Postgres running
