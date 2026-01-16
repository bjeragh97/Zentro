from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession

from app.models.business import Business
from app.schemas.business import BusinessCreate


async def create_business(db: AsyncSession, payload: BusinessCreate) -> Business:
    business = Business(name=payload.name)
    db.add(business)
    await db.commit()
    await db.refresh(business)
    return business


async def list_businesses(db: AsyncSession) -> list[Business]:
    result = await db.execute(select(Business).order_by(Business.created_at.desc()))
    return list(result.scalars().all())
