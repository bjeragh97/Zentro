# API (FastAPI)

Purpose: Document current endpoints, routing, and versioning.

## Versioning
- All routes are prefixed with `/api/v1`
- Health endpoint is unversioned at `/health`

## Endpoints

### Health
- `GET /health`

### Businesses
- `POST /api/v1/businesses`
- `GET /api/v1/businesses`

### Customers
- `POST /api/v1/customers`
- `GET /api/v1/customers`

## Notes
- Routers use dependency-injected async DB sessions
- Responses use Pydantic schemas with `from_attributes`
