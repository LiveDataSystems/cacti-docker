ARG PHP_VERSION=7.0
FROM php:${PHP_VERSION}-apache

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN apt-get update \ 
&& apt-get upgrade -y \ 
&& apt-get install -y sudo curl wget git cron nano zip unzip rrdtool snmp snmpd \
&& chmod uga+x /usr/local/bin/install-php-extensions \
&& sync \ 
&& install-php-extensions mysqli pdo_mysql zip gd bcmath intl gmp imagick exif opcache snmp gd ldap \
&& a2enmod rewrite \
&& a2enmod proxy \
&& a2enmod proxy_http

WORKDIR /var/www/