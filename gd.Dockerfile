ARG VERSION
FROM paliari/apache-php8:${VERSION}

# Image layers keep only whole-second mtimes, so the font dirs are truncated before
# building the fontconfig cache; otherwise it is stale at runtime and www-data can't rebuild it.
RUN apt-get update && apt-get install -y libaio-dev libjpeg-dev libpng-dev libfreetype6-dev \
  && docker-php-ext-configure gd --with-freetype --with-jpeg \
  && docker-php-ext-install gd \
  && apt-get install -y imagemagick \
  && apt-get purge -y --auto-remove \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/* \
  && find -L /usr/share/fonts /usr/local/share/fonts -type d -exec touch -d "@$(date +%s)" {} + \
  && fc-cache -f
