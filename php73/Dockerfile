FROM phpdockerio/php73-fpm:latest

RUN apt-get update \
    && apt-get -y --no-install-recommends install \
    php-memcached \
    php-memcache \
    php7.3-mbstring \
    php7.3-mysql \
    php7.3-intl \
    php-xdebug \
    php7.3-interbase \
    php7.3-soap \
    php7.3-gd \
    php-imagick \
    libmcrypt-dev \
    php7.3-opcache \
    php7.3-zip \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

MAINTAINER vitams

ADD ./php.ini /etc/php/7.3/fpm/conf.d/90-php.ini
ADD ./php.ini /etc/php/7.3/cli/conf.d/90-php.ini

RUN usermod -u 1000 www-data

WORKDIR "/var/www/bitrix"

EXPOSE 9000
