import uuid
from datetime import datetime

from pydantic import BaseModel, ConfigDict


class CustomerCreate(BaseModel):
    name: str
    email: str


class CustomerRead(BaseModel):
    model_config = ConfigDict(from_attributes=True)

    id: uuid.UUID
    name: str
    email: str
    created_at: datetime
