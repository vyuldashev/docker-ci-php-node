FROM ubuntu:16.04

RUN export LC_ALL=C.UTF-8
RUN apt-get update
RUN apt-get install build-essential apt-utils -y

# PHP
RUN apt-get install -y \
    php7.0 \
    php7.0-curl \
    php7.0-gd \
    php7.0-dev \
    php7.0-xml \
    php7.0-bcmath

RUN php -v

# Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('SHA384', 'composer-setup.php') === 'e115a8dc7871f15d853148a7fbac7da27d6c0030b848d9b3dc09e2a0388afed865e6a3d6b3c0fad45c48e2b5fc1196ae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer

RUN composer --version

# Node.js
RUN curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh && \
    bash nodesource_setup.sh && \
    apt-get install nodejs -y

RUN node -v
RUN npm -v
