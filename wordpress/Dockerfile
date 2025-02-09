FROM debian:bullseye

RUN apt update -y && apt upgrade -y && \
    apt-get install -y wget

RUN apt-get install -y php7.3\
                    php7.4-fpm\
                    php-mysql\
                    mariadb-client

COPY wp.sh /wp.sh

RUN chmod +x wp.sh

ENTRYPOINT ["./wp.sh"]