FROM debian:bullseye

RUN apt update -y && apt upgrade -y && \
					apt-get install -y python3

COPY index.html /portfolio/index.html

WORKDIR /portfolio

ENTRYPOINT ["python3", "-m", "http.server", "4444"]