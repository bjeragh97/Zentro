#!/usr/bin/env bash
set -euo pipefail

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is not installed."
  echo "Install it from: https://brew.sh"
  echo "Then re-run: ./scripts/brew-setup.sh"
  exit 1
fi

echo "Updating Homebrew..."
brew update

packages=(
  git
  tmux
  htop
  eza
  postgresql@16
  redis
  pyenv
  direnv
)

echo "Installing packages (idempotent)..."
for pkg in "${packages[@]}"; do
  if brew list --versions "$pkg" >/dev/null 2>&1; then
    echo "- $pkg already installed"
  else
    echo "- Installing $pkg"
    brew install "$pkg"
  fi
done

echo ""
echo "Recommended ~/.zshrc additions (copy/paste):"
echo ""
echo "# Pyenv"
echo "export PYENV_ROOT=\"\$HOME/.pyenv\""
echo "command -v pyenv >/dev/null || export PATH=\"\$PYENV_ROOT/bin:\$PATH\""
echo "eval \"\$(pyenv init -)\""
echo ""
echo "# Postgres"
echo "export PATH=\"/usr/local/opt/postgresql@16/bin:\$PATH\""
echo ""
echo "# Direnv"
echo "eval \"\$(direnv hook zsh)\""
echo ""

echo "Verifying installs..."
brew --version
psql --version
redis-server --version
pyenv --version
direnv --version

echo "Done."
