#!/bin/bash

# Wait for the database and redis to be available
echo "Waiting for database and redis..."
sleep 30

# Generate application key
echo "Generating application key..."
php artisan key:generate

# Run migrations
echo "Running migrations..."
php artisan migrate --seed

# Create admin user
echo "Creating admin user..."
php artisan p:admin --email admin@example.com --password admin_password

# Start the Pterodactyl Panel
echo "Starting Pterodactyl Panel..."
exec php-fpm
