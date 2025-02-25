FROM debian:bullseye

RUN apt update -y && apt upgrade -y && \
                    apt-get install -y nginx openssl


COPY ./tools/nginx.conf /etc/nginx/nginx.conf

COPY ./tools/ng.sh /ng.sh

RUN chmod +x ng.sh

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=MAROC/O=1337/OU=1337/CN=localhost/UID=ybellakr"

ENTRYPOINT ["./ng.sh"]