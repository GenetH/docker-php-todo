#!/bin/bash
# Run Laravel migrations and setup
php artisan migrate --force
php artisan db:seed --force
php artisan config:cache
php artisan cache:clear
php artisan route:clear

# Start Laravel server
php artisan serve --host=0.0.0.0 
