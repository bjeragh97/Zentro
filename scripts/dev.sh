#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
REPO_ROOT=$(cd "$SCRIPT_DIR/.." && pwd)

cd "$REPO_ROOT/api"

PYTHON_BIN="python"
if ! command -v "$PYTHON_BIN" >/dev/null 2>&1; then
  PYTHON_BIN="python3"
fi

if [[ ! -d "$REPO_ROOT/.venv" ]]; then
  echo "Creating virtualenv..."
  "$PYTHON_BIN" -m venv "$REPO_ROOT/.venv"
fi

VENV_PY="$REPO_ROOT/.venv/bin/python"
if [[ -f "$REPO_ROOT/.venv/bin/activate" ]]; then
  # shellcheck disable=SC1091
  source "$REPO_ROOT/.venv/bin/activate"
  PY_CMD="python"
  PIP_CMD="pip"
else
  PY_CMD="$VENV_PY"
  PIP_CMD="$VENV_PY -m pip"
fi

if ! $PY_CMD -m pip --version >/dev/null 2>&1; then
  $PY_CMD -m ensurepip --upgrade
fi

$PIP_CMD install -r requirements.txt

if [[ -f .env ]]; then
  echo "Loading .env..."
  set -a
  # shellcheck disable=SC1091
  source .env
  set +a
fi

if command -v alembic >/dev/null 2>&1; then
  echo "Running migrations..."
  alembic upgrade head
fi

export DYLD_LIBRARY_PATH="/usr/local/opt/postgresql@16/lib:${DYLD_LIBRARY_PATH:-}"

echo "Starting FastAPI dev server..."
$PY_CMD -m uvicorn app.main:app --reload --app-dir .
