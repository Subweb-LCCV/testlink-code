FROM php:7.4-apache

# Instala dependências e extensões PHP
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
        postgresql-client \
        zlib1g-dev \
        libpng-dev \
        libjpeg-dev \
        libfreetype6-dev \
        libpq-dev && \
    docker-php-ext-install pdo pdo_pgsql pgsql && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Configura diretório de trabalho
WORKDIR /var/www/html

# Copia arquivos da aplicação
COPY cfg/ cfg/
COPY custom/ custom/
COPY extra/ extra/
COPY gui/ gui/
COPY lib/ lib/
COPY locale/ locale/
COPY node_modules/ node_modules/
COPY plugins/ plugins/
COPY third_party/ third_party/
COPY upload_area/ /var/testlink/upload_area/
COPY logs/ /var/testlink/logs/
COPY vendor/ vendor/
COPY *.php ./

# Configuração do PHP
COPY ./docker/php.ini-production /usr/local/etc/php/conf.d/php.ini

# Ajusta permissões
RUN chown -R www-data:www-data /var/www/html/gui/templates_c
RUN chown -R www-data:www-data /var/testlink/upload_area/
RUN chown -R www-data:www-data /var/testlink/logs/