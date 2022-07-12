FROM paliari/apache-php8:2.0.1-gd

COPY php/vars-dev.ini /usr/local/etc/php/conf.d/vars.ini

RUN apt-get update && apt-get -y install curl git wget vim \
  && cp -f "/usr/local/etc/php/php.ini-development" /usr/local/etc/php/php.ini \
  && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
  && apt-get purge -y --auto-remove \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/*
