# Coding Standards

Purpose: Keep the codebase consistent and easy to maintain.

## General
- Favor clarity over cleverness
- Keep functions small and focused
- Avoid premature abstractions

## Python style
- Use type hints for public functions
- Prefer explicit imports over wildcard
- Keep module responsibilities narrow

## FastAPI
- Routers should be thin and call services
- Use Pydantic schemas for I/O
- Keep HTTP details in routers, not services

## Database
- Use SQLAlchemy 2.0 style
- Keep transaction boundaries explicit in services
- Add indexes only when needed

## Checklists
- [ ] Added/updated schemas
- [ ] Service logic covered
- [ ] Router response models set
- [ ] Migration created if schema changed
