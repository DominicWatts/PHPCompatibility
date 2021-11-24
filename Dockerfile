
FROM php:8.0-cli

MAINTAINER Dominic <dominic@xigen.co.uk>

ENV COMPOSER_ALLOW_SUPERUSER=1 \
    COMPOSER_MEMORY_LIMIT=-1 \
    PHP_MEMORY_LIMIT=2G

RUN apt-get update \
 && apt-get install -y \
    zlib1g-dev \
    libzip-dev \
    zip \
    git

RUN docker-php-ext-install \
  zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN composer global require squizlabs/php_codesniffer:^3 \
  && composer global require phpcompatibility/php-compatibility \
  && composer global require dealerdirect/phpcodesniffer-composer-installer \
  && mkdir -p /code

ENV PATH="/root/.composer/vendor/squizlabs/php_codesniffer/bin:${PATH}"

WORKDIR /code
VOLUME /code
