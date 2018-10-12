FROM mistical/php-5.3.10

MAINTAINER Juan Gabriel Valdés Díaz <jgvaldes1992@gmail.com>

# Install git, nano, apache and php extensions 
RUN apt-get update && \
	apt-get -y install git nano apache2 libapache2-mod-php5 mysql-server php5-mysql php-apc php5-mcrypt

# Remove pre installed databases
RUN rm -rf /var/lib/mysql/*

# config to enable .htaccess
RUN a2enmod rewrite

#Enviornment variables to configure php
ENV PHP_UPLOAD_MAX_FILESIZE 10M
ENV PHP_POST_MAX_SIZE 10M
ENV MYSQL_PASS "dockerpass"

# Add volumes for MySQL
VOLUME ["/etc/mysql", "/var/lib/mysql", "/var/www/html"]

# Expose ports
EXPOSE 80 3306 25

CMD ["/bin/bash"]
