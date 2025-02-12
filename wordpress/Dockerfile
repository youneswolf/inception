FROM debian:bullseye

RUN apt update -y && apt upgrade -y && \
                    apt-get install -y wget php7.4   \
                    php7.4-fpm  \
                    php-mysql   \
                    mariadb-client

COPY wp.sh /wp.sh

RUN chmod +x wp.sh

RUN sed -i 's#listen = /run/php/php7.4-fpm.sock#listen = 0.0.0.0:9000#' /etc/php/7.4/fpm/pool.d/www.conf

ENTRYPOINT ["./wp.sh"]