# Gunakan gambar dasar yang sesuai
FROM ghcr.io/pterodactyl/panel:latest

# Salin konfigurasi dan data yang diperlukan ke dalam gambar
COPY ./var /app/var
COPY ./nginx /etc/nginx/http.d/
COPY ./certs /etc/letsencrypt/
COPY ./logs /app/storage/logs

# Set variabel lingkungan
ENV APP_URL="https://pterodactyl.example.com"
ENV APP_TIMEZONE="UTC"
ENV APP_SERVICE_AUTHOR="noreply@example.com"
ENV TRUSTED_PROXIES="*"
ENV LE_EMAIL=""
ENV MAIL_FROM="noreply@example.com"
ENV MAIL_DRIVER="smtp"
ENV MAIL_HOST="mail"
ENV MAIL_PORT="1025"
ENV MAIL_USERNAME=""
ENV MAIL_PASSWORD=""
ENV MAIL_ENCRYPTION="true"
ENV DB_PASSWORD="CHANGE_ME"
ENV APP_ENV="production"
ENV APP_ENVIRONMENT_ONLY="false"
ENV CACHE_DRIVER="redis"
ENV SESSION_DRIVER="redis"
ENV QUEUE_DRIVER="redis"
ENV REDIS_HOST="cache"
ENV DB_HOST="database"
ENV DB_PORT="3306"
