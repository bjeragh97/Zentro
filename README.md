# Zentro

Zentro is a B2C customer engagement platform for local businesses. It is not a delivery marketplace. The focus is on customer relationships, loyalty, and communication.

## Quickstart
```bash
python -m venv .venv
source .venv/bin/activate
pip install -r api/requirements.txt
cp api/.env.example api/.env

cd api
alembic revision --autogenerate -m "init"
alembic upgrade head

uvicorn app.main:app --reload --app-dir api
```

## Docs
- `docs/README.md`
