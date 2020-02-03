FROM php:7.4.1-fpm-alpine
RUN  apk upgrade --update \
    && apk add --no-cache libzip-dev bzip2-dev postgresql-dev icu-dev libxml2-dev libxslt-dev libgcrypt-dev libjpeg-turbo-dev libpng-dev freetype-dev rabbitmq-c-dev libssh2-dev git \
    && docker-php-ext-configure zip \
    && docker-php-ext-configure gd \
    && git clone https://github.com/esminis/php_pecl_rar.git /usr/src/php/ext/rar \
    && docker-php-ext-configure rar \
    && printf "\n" | pecl install redis \
    && printf "\n" | pecl install mongodb \
    && printf "\n" | pecl install amqp \
    && printf "\n" | pecl install ssh2-1.2 \
    && printf "\n" | pecl install xdebug \
    && docker-php-ext-enable redis mongodb amqp ssh2 xdebug \
    && docker-php-ext-install rar bcmath bz2 calendar exif opcache pdo_mysql pdo_pgsql intl zip soap gd xsl pcntl sockets