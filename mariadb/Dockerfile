FROM debian:bullseye

RUN apt update -y && apt upgrade -y && \
    apt install -y mariadb-server

COPY maria.sh /maria.sh

RUN chmod +x maria.sh

ENTRYPOINT ["./maria.sh"]
