FROM php:8.2-fpm-alpine
WORKDIR /var/www/html
COPY composer.json ./
RUN apk add --no-cache git \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && php -r "unlink('composer-setup.php');" \
    && composer install --no-dev --prefer-dist \
    && rm -rf /root/.composer
COPY . .
EXPOSE 3004
CMD ["php", "-S", "0.0.0.0:3004", "-t", "src"]
