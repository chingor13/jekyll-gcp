FROM debian:8
RUN mkdir -p /src/php
WORKDIR /src/php
RUN apt-get update && \
    apt-get install -y build-essential autoconf automake libtool \
                       bison re2c curl libcurl4-openssl-dev \
                       libssl-dev libxml2-dev libxslt1-dev pkg-config

ARG PHP_VERSION
ARG PHP_OPTIONS

RUN curl -L https://github.com/php/php-src/archive/php-${PHP_VERSION}.tar.gz \
         -o /src/php/php.tar.gz
RUN tar -zxf php.tar.gz && \
    cd php-src-php-${PHP_VERSION} && \
    ./buildconf --force && \
    ./configure --enable-mbstring \
                --enable-opcache \
                --enable-shared \
                --enable-sockets \
                --with-curl \
                --with-openssl \
                --with-zlib \
                ${PHP_OPTIONS} && \
    make -j"$(nproc)" && \
    make install
