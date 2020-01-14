FROM phpdockerio/php7-fpm:latest

RUN apt-get update \
    && apt-get -y --no-install-recommends install \
    php-memcached \
    php-memcache \
    php7.0-mbstring \
    php7.0-mysql \
    php7.0-intl \
    php-xdebug \
    php7.0-interbase \
    php7.0-soap \
    php7.0-gd \
    php-imagick \
    php7.0-mcrypt \
    php7.0-opcache \
    php7.0-zip \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

MAINTAINER vitams

ADD ./php.ini /etc/php/7.0/fpm/conf.d/90-php.ini
ADD ./php.ini /etc/php/7.0/cli/conf.d/90-php.ini

RUN usermod -u 1000 www-data

WORKDIR "/var/www/bitrix"
WORKDIR "/var/www/bitrix2"

EXPOSE 9000