from fastapi import APIRouter, Depends, status
from sqlalchemy.ext.asyncio import AsyncSession

from app.db.session import get_db
from app.schemas.business import BusinessCreate, BusinessRead
from app.services.businesses import create_business, list_businesses

router = APIRouter(prefix="/businesses", tags=["businesses"])


@router.post("", response_model=BusinessRead, status_code=status.HTTP_201_CREATED)
async def create_business_endpoint(
    payload: BusinessCreate,
    db: AsyncSession = Depends(get_db),
) -> BusinessRead:
    return await create_business(db, payload)


@router.get("", response_model=list[BusinessRead])
async def list_businesses_endpoint(
    db: AsyncSession = Depends(get_db),
) -> list[BusinessRead]:
    return await list_businesses(db)
