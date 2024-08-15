#!/bin/bash

# Ensure necessary directories exist
mkdir -p /app/var

# Generate the application key if it does not already exist
if [ ! -f /app/var/.env ]; then
    echo "Generating .env file..."
    touch /app/var/.env
    # Optionally, you can add default configurations to .env here
fi

# Check if database is reachable
echo "Waiting for database connection..."
until nc -z -v -w30 $DB_HOST $DB_PORT
do
  echo "Waiting for database connection..."
  sleep 5
done

echo "Database is up and running"

# Check if Redis is reachable
echo "Waiting for Redis connection..."
until nc -z -v -w30 $REDIS_HOST 6379
do
  echo "Waiting for Redis connection..."
  sleep 5
done

echo "Redis is up and running"
