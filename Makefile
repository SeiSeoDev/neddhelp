
all: confs up

confs:
	@ sudo mkdir -p /home/dasanter/data/db_data
	@ sudo mkdir -p /home/dasanter/data/wp_data
	@ sudo grep "dasanter.42.fr" /etc/hosts || sudo sh -c 'echo "127.0.0.1 dasanter.42.fr" >> /etc/hosts'

up:
	docker-compose -f srcs/docker-compose.yml up --build -d

clean:
	docker-compose -f srcs/docker-compose.yml down --rmi all

fclean: clean
	docker system prune --all --volumes --force

	sudo rm -rf /home/dasanter/data

re: fclean all

.PHONY: all clean fclean re confs
