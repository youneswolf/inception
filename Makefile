all:
	cd srcs && mkdir -p /home/ybellakr/data/wordpress && mkdir -p /home/ybellakr/data/mariadb && docker compose up

down: 
	cd srcs && rm -rf /home/ybellakr/data && docker compose down
	docker rmi -f $(shell docker images -q)