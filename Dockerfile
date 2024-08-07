FROM php:8.2-apache

LABEL maintainer="Marcos A Paliari <marcos@paliari.com.br>"

RUN apt-get update && apt-get -y install libicu-dev libxml2-dev libzip-dev \
  && docker-php-ext-install pdo_mysql exif opcache \
  && docker-php-ext-install intl soap dom \
  && docker-php-ext-install zip \
  && docker-php-ext-install sockets \
  && apt-get purge -y --auto-remove \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir -p /var/www/html/public \
  && a2enmod headers rewrite

RUN pecl install redis \
  && rm -rf /tmp/pear \
  && docker-php-ext-enable redis

WORKDIR /var/www/html

COPY apache/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY apache/charset.conf /etc/apache2/conf-available/charset.conf
COPY src/index.php /var/www/html/public/index.php
COPY php/vars-pro.ini /usr/local/etc/php/conf.d/vars.ini

RUN cp -f "/usr/local/etc/php/php.ini-production" /usr/local/etc/php/php.ini
