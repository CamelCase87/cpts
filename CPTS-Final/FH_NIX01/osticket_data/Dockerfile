FROM ubuntu:20.04
RUN DEBIAN_FRONTEND='noninteractive' apt update -y
RUN DEBIAN_FRONTEND='noninteractive' apt install git wget unzip apache2 php php-mysqli mysql-client mysql-server software-properties-common -y
RUN add-apt-repository ppa:ondrej/php -y 
RUN DEBIAN_FRONTEND='noninteractive' apt install -y php7.1-cli 
RUN wget https://github.com/osTicket/osTicket/releases/download/v1.14.2/osTicket-v1.14.2.zip
RUN mkdir /tmp/osticket && unzip osTicket-v1.14.2.zip -d /tmp/osticket
RUN rm -rf /var/www/html/index.html
RUN cd /tmp/osticket/upload && php manage.php deploy --setup /var/www/html/
RUN cd /var/www/html/include && mv ost-sampleconfig.php ost-config.php
RUN chown -R www-data:www-data /var/www/html
RUN service mysql restart
RUN phpenmod mysqli
EXPOSE 80
CMD ["sh","-c","/usr/sbin/service mysql start && /usr/sbin/apache2ctl -D FOREGROUND"]
