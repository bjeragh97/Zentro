from fastapi import APIRouter, Depends, status
from sqlalchemy.ext.asyncio import AsyncSession

from app.db.session import get_db
from app.schemas.customer import CustomerCreate, CustomerRead
from app.services.customers import create_customer, list_customers

router = APIRouter(prefix="/customers", tags=["customers"])


@router.post("", response_model=CustomerRead, status_code=status.HTTP_201_CREATED)
async def create_customer_endpoint(
    payload: CustomerCreate,
    db: AsyncSession = Depends(get_db),
) -> CustomerRead:
    return await create_customer(db, payload)


@router.get("", response_model=list[CustomerRead])
async def list_customers_endpoint(
    db: AsyncSession = Depends(get_db),
) -> list[CustomerRead]:
    return await list_customers(db)
