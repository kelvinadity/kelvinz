# Gunakan image dasar dari Pterodactyl Panel
FROM ghcr.io/pterodactyl/panel:latest

# Set environment variables
ENV DB_PASSWORD=CHANGE_ME
ENV APP_URL=https://pterodactyl.example.com
ENV APP_TIMEZONE=UTC
ENV APP_SERVICE_AUTHOR=noreply@example.com
ENV TRUSTED_PROXIES=*
ENV MAIL_FROM=noreply@example.com
ENV MAIL_DRIVER=smtp
ENV MAIL_HOST=mail
ENV MAIL_PORT=1025
ENV MAIL_USERNAME=kelvinzmodz@gmail.com
ENV MAIL_PASSWORD=kelvinzmodz
ENV MAIL_ENCRYPTION=true
ENV APP_ENV=production
ENV APP_ENVIRONMENT_ONLY=false
ENV CACHE_DRIVER=redis
ENV SESSION_DRIVER=redis
ENV QUEUE_DRIVER=redis
ENV REDIS_HOST=cache
ENV DB_HOST=database
ENV DB_PORT=3306

# Expose ports for HTTP and HTTPS
EXPOSE 80
EXPOSE 443

# Perintah untuk memulai aplikasi
CMD ["sh", "-c", "php /app/artisan p:environment:setup && php /app/artisan p:environment:install && php /app/artisan migrate && php /app/artisan queue:work --daemon"]
