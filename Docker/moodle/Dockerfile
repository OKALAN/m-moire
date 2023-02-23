FROM ubuntu:22.04

RUN apt-get update
# REF TIER
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:ondrej/php

# Install Apache2 and PHP
RUN apt-get update && apt-get install -y apache2 git
RUN export DEBIAN_FRONTEND=noninteractive
RUN apt-get update

ENV TZ=Africa/Dakar
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update
RUN apt install -y tzdata

# Install Moodle dependencies
RUN apt-get install -y  php7.4 libapache2-mod-php7.4 php7.4-common php7.4-mysql php7.4-gmp php7.4-curl php7.4-intl php7.4-mbstring php7.4-xmlrpc php7.4-gd php7.4-xml php7.4-cli php7.4-zip

#Paramétrage de config php
RUN echo "file_uploads = On" >> /etc/php/7.4/apache2/php.ini
RUN echo "allow_url_fopen = On" >> /etc/php/7.4/apache2/php.ini
RUN echo "short_open_tag = On" >> /etc/php/7.4/apache2/php.ini
RUN echo "memory_limit = 256M" >> /etc/php/7.4/apache2/php.ini
RUN echo "cgi.fix_pathinfo = 0" >> /etc/php/7.4/apache2/php.ini
RUN echo "upload_max_filesize = 100M" >> /etc/php/7.4/apache2/php.ini
RUN echo "max_execution_time = 360" >> /etc/php/7.4/apache2/php.ini
RUN echo "date.timezone = Africa/Dakar" >> /etc/php/7.4/apache2/php.ini


# Copiez les fichiers Moodle dans le conteneur
RUN cd /var/www/html
RUN git clone -b MOODLE_39_STABLE git://git.moodle.org/moodle.git
RUN mv moodle /var/www

RUN mkdir -p /var/www/moodledata
RUN chown -R www-data:www-data /var/www/
RUN chmod -R 755 /var/www/

#configurer apache pour Moodle
RUN echo "ServerName 127.0.0.1" >> /etc/apache2/apache2.conf

RUN  rm -rf /var/www/html/

RUN  sed -i 's/html/moodle/g' /etc/apache2/sites-enabled/000-default.conf
RUN  cat /etc/apache2/sites-enabled/000-default.conf | grep DocumentRoot

# Expose port 80
EXPOSE 80

# Start Apache2
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]


