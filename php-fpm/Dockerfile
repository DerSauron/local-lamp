FROM php:7.3-fpm

ARG USER_ID
ARG GROUP_ID

RUN groupadd -g ${GROUP_ID} service_user && useradd -M -u ${USER_ID} -g ${GROUP_ID} service_user

RUN apt update && apt upgrade -y && apt autoremove --purge -y

RUN mkdir -p /usr/local/bin
ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/

RUN chmod uga+x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions mysqli bz2 calendar gettext pdo_mysql sysvmsg sysvsem sysvshm xdebug-2.9.8 opcache zip curl

COPY ./www.conf /usr/local/etc/php-fpm.d/

COPY ./sshtunnel /usr/local/bin/
RUN chmod +x /usr/local/bin/sshtunnel
