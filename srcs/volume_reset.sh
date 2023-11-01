#cada vez que se faz o up tem de se alterar estas permissões aos volumes para que o sitema consiga utilizar as folders
#o rm apaga toda a informação
sudo rm -rf /home/dasanter/data/wordpress/*
sudo rm -rf /home/dasanter/data/mariadb/*
docker volume rm volume_mariadb
docker volume rm volume_wordpress
sudo chmod -R 777 /home/dasanter/data
sudo chown -R dasanter:dasanter /home/dasanter/data
