# Use the official PHP image as a base
FROM php:8.2-fpm

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    zip \
    unzip \
    git \
    curl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd zip mysqli pdo pdo_mysql opcache

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/bitrix

# Set permissions
RUN chown -R www-data:www-data /var/www/bitrix \
    && chmod -R 755 /var/www/bitrix

# Expose port
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm"]