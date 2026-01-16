from fastapi import FastAPI

from app.core.config import get_settings
from app.routers import businesses_router, customers_router

settings = get_settings()

app = FastAPI(title="Zentro API")


@app.get("/health")
async def health_check() -> dict[str, str]:
    return {"status": "ok"}


app.include_router(businesses_router, prefix=settings.api_v1_prefix)
app.include_router(customers_router, prefix=settings.api_v1_prefix)
