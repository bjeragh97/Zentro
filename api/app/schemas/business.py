import uuid
from datetime import datetime

from pydantic import BaseModel, ConfigDict


class BusinessCreate(BaseModel):
    name: str


class BusinessRead(BaseModel):
    model_config = ConfigDict(from_attributes=True)

    id: uuid.UUID
    name: str
    created_at: datetime
