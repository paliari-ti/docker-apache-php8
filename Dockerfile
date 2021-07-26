FROM php:8.0-apache

LABEL maintainer="Marcos A Paliari <marcos@paliari.com.br>"

RUN apt-get update \
  && apt-get -y install libzip-dev \
  && docker-php-ext-install opcache \
  && docker-php-ext-install zip \
  && apt-get purge -y --auto-remove \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir -p /var/www/html/public \
  && a2enmod headers rewrite

WORKDIR /var/www/html

COPY apache/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY apache/charset.conf /etc/apache2/conf-available/charset.conf
COPY php/timezone.ini /usr/local/etc/php/conf.d/timezone.ini
COPY src/index.php /var/www/html/public/index.php
COPY php/vars-pro.ini /usr/local/etc/php/conf.d/vars.ini

RUN cp -f "/usr/local/etc/php/php.ini-production" /usr/local/etc/php/php.ini
