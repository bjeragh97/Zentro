# Project Status

Purpose: Single source of truth for what works, what is next, and known risks.

## Current milestone
- Scaffolded FastAPI backend with async SQLAlchemy and Alembic
- Core entities: Business, Customer

## What works now
- [x] FastAPI app with `/health`
- [x] Versioned API prefix `/api/v1`
- [x] Postgres connection via `DATABASE_URL`
- [x] Alembic configured and ready
- [x] CRUD endpoints (create/list) for businesses and customers

## What’s next
- [ ] Add basic validation rules (e.g., email format, name length)
- [ ] Add pagination and filtering
- [ ] Add basic test coverage for services and routers
- [ ] Add CI checks (lint/test)

## Known risks
- Database connection configuration not validated on startup
- No auth or rate limiting
- No uniqueness constraints (e.g., customer email)

## Weekly log
- 2025-xx-xx: Initialized FastAPI, SQLAlchemy, Alembic, and base models
- 2025-xx-xx: Added docs system
