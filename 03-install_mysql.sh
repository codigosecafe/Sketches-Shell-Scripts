#!/bin/bash
echo "\n\n"
echo "#=============================================================================="
echo "# title       : INSTALL MYSQL 5.7"
echo "# description : Script para instalacao do MySQL 5.7"
echo "# author      : Claudio Alexssandro Lino"
echo "# github      : https://github.com/codigosecafe"
echo "# version     : 1.0.0"
echo "#=============================================================================="
echo "\n"

cd ~/
wget https://dev.mysql.com/get/mysql-apt-config_0.8.15-1_all.deb
dpkg -i mysql-apt-config_0.8.15-1_all.deb
apt-get update
apt-get install -y mysql-server
mysql_upgrade -u root -p --force
service mysql stop
usermod -d /var/lib/mysql/ mysql
service mysql start
rm -rf mysql*.deb