all: 
	docker build -t nginx_img srcs/requirements/nginx/

fclean: 
		docker system prune -a
