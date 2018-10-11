FROM mistical/php-5.3.10

MAINTAINER Juan Gabriel Valdés Díaz <jgvaldes1992@gmail.com>

# Install git, nano, apache and php extensions 
RUN apt-get update && \
	apt-get -y install git nano apache2 libapache2-mod-php5 mysql-server php5-mysql php-apc php5-mcrypt

# Remove pre installed databases
RUN rm -rf /var/lib/mysql/*

# Add image configuration and scripts
ADD start-apache2.sh /start-apache2.sh
ADD start-mysqld.sh /start-mysqld.sh
ADD run.sh /run.sh

# Add MySQL utils
ADD create_mysql_admin_user.sh /create_mysql_admin_user.sh

RUN chmod 755 /*.sh

# config to enable .htaccess
ADD apache_default /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite

#Enviornment variables to configure php
ENV PHP_UPLOAD_MAX_FILESIZE 10M
ENV PHP_POST_MAX_SIZE 10M
ENV MYSQL_PASS "dockerpass"

# Add volumes for MySQL
VOLUME ["/etc/mysql", "/var/lib/mysql", "/var/www/html"]

# Expose ports
EXPOSE 80 3306 25

CMD ["/run.sh"]
