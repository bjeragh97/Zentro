# Database (Postgres)

Purpose: Capture schema philosophy and key database decisions.

## Schema philosophy
- Two core entities: Business and Customer
- Keep relationships simple and explicit
- Avoid hardcoding business types

## Relationships
- Customers are associated with Businesses conceptually (future: add FK and join tables as needed)
- Current schema keeps entities independent while API evolves

## UUIDs
- UUIDs are used as primary keys for portability and safety
- Generated in application code using `uuid.uuid4`

## Timestamps
- `created_at` on each model
- Defaulted at the DB level with `server_default=now()`

## Indexes
- Add indexes when query patterns are clear (e.g., email lookups)
- Avoid premature indexing

## Why Postgres
- Strong relational features
- UUID support
- Great ecosystem with Alembic/SQLAlchemy
- Easy local setup via Homebrew
