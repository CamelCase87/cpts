#!/bin/bash
docker build -t osticket .
docker run -d -t -p 8005:80 --name osticket osticket:latest
docker exec osticket bash -c "mysql -u root -e \"ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 't00r'\";"
docker cp config.sql osticket:/tmp/config.sql
docker exec osticket bash -c "mysql osticket < config.sql"
