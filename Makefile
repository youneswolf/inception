all:
	cd srcs && docker compose up

down: 
	cd srcs && docker compose down
	docker rmi -f $(shell docker images -q)