# Local Setup

Purpose: Get the API running locally on macOS with minimal steps.

## Prerequisites
- macOS with zsh
- Homebrew

## Brew install (recommended)
```bash
./scripts/brew-setup.sh
```

## Create venv
```bash
python -m venv .venv
source .venv/bin/activate
pip install -r api/requirements.txt
```

## Env vars
- Copy example file:
```bash
cp api/.env.example api/.env
```
- Update `DATABASE_URL` if needed

## DB setup
```bash
./scripts/postgres-setup.sh
```

## Run migrations
```bash
cd api
alembic revision --autogenerate -m "init"
alembic upgrade head
```

## Run FastAPI
```bash
./scripts/dev.sh
```

## Quick sanity check
```bash
curl http://127.0.0.1:8000/health
```
