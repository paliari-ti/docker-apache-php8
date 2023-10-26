FROM paliari/apache-php8:2.2.0

RUN apt-get update && apt-get install -y libaio-dev libjpeg-dev libpng-dev libfreetype6-dev \
  && docker-php-ext-configure gd --with-freetype --with-jpeg \
  && docker-php-ext-install gd \
  && apt-get install -y imagemagick \
  && sed -i_bak 's/rights="none" pattern="PDF"/rights="read | write" pattern="PDF"/' /etc/ImageMagick-6/policy.xml \
  && apt-get purge -y --auto-remove \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/*
