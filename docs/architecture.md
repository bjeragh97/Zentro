# Architecture

Purpose: Describe the high-level structure and how responsibilities are separated.

## Overview
- API-first backend using FastAPI
- Async SQLAlchemy for database access
- Alembic for schema migrations

## Layers
- `app/routers`: HTTP layer, request/response models, dependency injection
- `app/services`: business logic and orchestration
- `app/models`: ORM models
- `app/schemas`: Pydantic schemas (request/response)
- `app/db`: DB session and base
- `app/core`: configuration and settings

## Principles
- Keep endpoints thin and move logic to services
- Prefer explicit, readable code over abstractions
- Optimize for maintainability by a solo developer

## Data flow
1. Request hits router
2. Router validates payload via schema
3. Service performs DB work
4. Router returns schema response
