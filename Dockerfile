# Use Pterodactyl Panel image
FROM ghcr.io/pterodactyl/panel:latest

# Environment Variables
ENV APP_URL=https://pterodactyl.example.com \
    APP_TIMEZONE=UTC \
    APP_SERVICE_AUTHOR=noreply@example.com \
    TRUSTED_PROXIES=* \
    LE_EMAIL= \
    MAIL_FROM=noreply@example.com \
    MAIL_DRIVER=smtp \
    MAIL_HOST=mail \
    MAIL_PORT=1025 \
    MAIL_USERNAME= \
    MAIL_PASSWORD= \
    MAIL_ENCRYPTION=true \
    DB_PASSWORD=CHANGE_ME \
    APP_ENV=production \
    APP_ENVIRONMENT_ONLY=false \
    CACHE_DRIVER=redis \
    SESSION_DRIVER=redis \
    QUEUE_DRIVER=redis \
    REDIS_HOST=cache \
    DB_HOST=database \
    DB_PORT=3306

# Expose ports for HTTP and HTTPS
EXPOSE 80
EXPOSE 443

# Copy setup and run scripts
COPY setup.sh /setup.sh
COPY run.sh /run.sh
RUN chmod +x /setup.sh /run.sh

# Run setup script and then the main application
CMD ["/bin/bash", "-c", "/setup.sh && /run.sh"]
