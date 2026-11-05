ARG VERSION
FROM paliari/apache-php8:${VERSION}-dev

RUN pecl install pcov \
  && docker-php-ext-enable pcov \
  && pecl clear-cache
