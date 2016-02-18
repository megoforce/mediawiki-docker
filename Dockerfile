FROM debian:jessie
MAINTAINER Cristian Gonzalez <cristian@mego.cl>
RUN apt-get -y update && apt-get -y dist-upgrade && apt-get -y install wget imagemagick
RUN apt-get -y install apache2 libapache2-mod-php5 php5-cli php-apc php5-mcrypt php5-mysql
RUN apt-get -y install mysql-client
RUN a2enmod php5
EXPOSE 80

WORKDIR /var/www/html
RUN wget https://releases.wikimedia.org/mediawiki/1.26/mediawiki-1.26.2.tar.gz
RUN tar xvzf mediawiki-*.tar.gz 
RUN mv -v mediawiki*/* .
RUN rm /var/www/html/index.html
RUN ln -sf /dev/stdout /var/log/apache2/error.log
COPY LocalSettings.php /var/www/html/
COPY setup.sh /setup.sh
RUN chmod +x /setup.sh
CMD /etc/init.d/apache2 stop && /usr/sbin/apache2ctl -D FOREGROUND