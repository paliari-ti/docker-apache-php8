FROM paliari/apache-php8:2.2.0-dev

RUN pecl install pcov \
  && docker-php-ext-enable pcov \
  && pecl clear-cache
