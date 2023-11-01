echo $MYSQL_DATABASE
echo $MYSQL_DATABASE
echo $MYSQL_DATABASE
sleep 20
echo "###########################"
echo "STARTED WORDPRESS CONTAINER"
echo "###########################"
sleep 2
sed -i "s/WP_DBNAME/$MYSQL_DATABASE/g" /var/www/wordpress/wp-config.php
echo $MYSQL_DATABASE
echo "____________________________"
sleep 10
sed -i "s/MYSQL_USER/$MYSQL_USER/g" /var/www/wordpress/wp-config.php
sleep 1
sed -i "s/MYSQL_ROOT_PASSWORD/$MYSQL_ROOT_PASSWORD/g" /var/www/wordpress/wp-config.php
sleep 2

chmod -R 775 /var/www/
chown -R www-data:www-data /var/www/
#Remove Original config and change for updated
mkdir -p /run/php
touch /run/php/php7.3-fpm.pid
echo "End of conf"

php-fpm7.3 -F -R &
tail -500f /dev/null