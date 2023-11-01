FROM debian:buster
RUN apt update
RUN apt upgrade
RUN apt-get -y install wget
RUN apt-get install -y php
RUN apt-get install -y php-fpm
RUN apt-get install -y php-mysql
RUN apt-get install -y mariadb-client
RUN mkdir -p /var/www/html/wordpress \
    && wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp
RUN wget https://fr.wordpress.org/wordpress-6.3.2-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.3.2-fr_FR.tar.gz && rm wordpress-6.3.2-fr_FR.tar.gz
RUN	chown -R root:root /var/www/wordpress
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./tools/* .
RUN chmod +x auto_config.sh
COPY ./conf/wp-config.php /var/www/wordpress/
RUN sh auto_config.sh
CMD ["bash", "/auto_config.sh"]
# RUN cp -r /wordpress/* /var/www/wordpress/
