FROM php:8.2-apache

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    libmariadb-dev \
    libpq-dev \
 && docker-php-ext-install pdo pdo_mysql pdo_pgsql \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html
