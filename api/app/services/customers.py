from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession

from app.models.customer import Customer
from app.schemas.customer import CustomerCreate


async def create_customer(db: AsyncSession, payload: CustomerCreate) -> Customer:
    customer = Customer(name=payload.name, email=payload.email)
    db.add(customer)
    await db.commit()
    await db.refresh(customer)
    return customer


async def list_customers(db: AsyncSession) -> list[Customer]:
    result = await db.execute(select(Customer).order_by(Customer.created_at.desc()))
    return list(result.scalars().all())
