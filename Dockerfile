FROM php:7.4.13-fpm-alpine
RUN  apk upgrade --update \
    && apk add --no-cache libzip-dev bzip2-dev postgresql-dev icu-dev libmemcached-dev libxml2-dev \
        libxslt-dev libgcrypt-dev libjpeg-turbo-dev libpng-dev freetype-dev rabbitmq-c-dev libssh2-dev \
        imap-dev git subversion \
    && docker-php-ext-configure zip \
    && docker-php-ext-configure gd \
    && printf "\n" | pecl install redis \
    && printf "\n" | pecl install memcached-3.1.5 \
    && printf "\n" | pecl install memcache-4.0.5.2 \
    && printf "\n" | pecl install mongodb \
    && printf "\n" | pecl install amqp \
    && printf "\n" | pecl install ssh2-1.2 \
    && printf "\n" | pecl install rar \
    && printf "\n" | pecl install xdebug \
    && printf "\n" | CPPFLAGS="-DHAVE_SYS_FILE_H" pecl install dbase \
    && printf "\n" | pecl install swoole \
    && docker-php-ext-enable redis memcached memcache mongodb amqp ssh2 xdebug rar dbase swoole \
    && docker-php-ext-install bcmath bz2 calendar exif opcache pdo_mysql pdo_pgsql intl zip soap gd xsl pcntl sockets imap