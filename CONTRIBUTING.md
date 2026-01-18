# Contributing

Thanks for your interest in Zentro. This project is currently solo-maintained, but contributions are welcome.

## Quick steps
1. Fork the repo
2. Create a branch: `git checkout -b feature/your-change`
3. Make changes and add tests if applicable
4. Run checks: `python -m pytest` and `python -m ruff check .`
5. Open a pull request

## Guidelines
- Keep changes small and focused
- Update docs in `docs/` when behavior changes
- Prefer clarity over cleverness
- Avoid breaking API changes without a note in `docs/decisions.md`

## Commit style
- Use clear, imperative messages
- Example: `Add customer list pagination`
