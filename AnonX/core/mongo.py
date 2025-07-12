from motor.motor_asyncio import AsyncIOMotorClient
from pymongo import MongoClient
import config
from ..logging import LOGGER

# Async MongoDB client (used with Motor)
try:
    async_mongo_client = AsyncIOMotorClient(config.MONGO_DB_URI)
    mongodb = async_mongo_client.Anon  # "Anon" is your database name
    LOGGER(__name__).info("Connected to MongoDB [async]")
except Exception as e:
    LOGGER(__name__).error(f"Failed to connect [async]: {e}")
    mongodb = None

# Sync MongoDB client (used with PyMongo)
try:
    sync_mongo_client = MongoClient(config.MONGO_DB_URI)
    pymongodb = sync_mongo_client.Anon
    LOGGER(__name__).info("Connected to MongoDB [sync]")
except Exception as e:
    LOGGER(__name__).error(f"Failed to connect [sync]: {e}")
    pymongodb = None
