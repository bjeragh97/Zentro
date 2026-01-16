import os
from functools import lru_cache


class Settings:
    def __init__(self) -> None:
        self.database_url = os.getenv(
            "DATABASE_URL",
            "postgresql+psycopg://postgres:postgres@localhost:5432/zentro",
        )
        self.api_v1_prefix = "/api/v1"


@lru_cache
def get_settings() -> Settings:
    return Settings()
