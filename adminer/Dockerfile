FROM debian:bullseye

RUN apt update -y && apt upgrade -y && \
                    apt-get install -y adminer

RUN mv /usr/share/adminer/adminer.php /usr/share/adminer/index.php

ENTRYPOINT ["php", "-S" , "0.0.0.0:8888", "-t" , "/usr/share/adminer/"]