FROM php:7.2-fpm
WORKDIR /var/www
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libpq-dev \
        curl \
        libssl-dev libcurl4-openssl-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-configure curl --with-curl --with-openssl=/usr \
    && docker-php-ext-install -j$(nproc) gd pgsql curl json
