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
echo "|----------------------------------------------------------------------------------------------|"
echo "##### => Baixando o pacote do mysql."
echo "|----------------------------------------------------------------------------------------------|"
cd ~/
wget https://dev.mysql.com/get/mysql-apt-config_0.8.12-1_all.deb
echo "\n"
echo "|----------------------------------------------------------------------------------------------|"
echo "##### => Instalando as config do pacote do MySQL."
echo "|----------------------------------------------------------------------------------------------|"
sudo apt install ./mysql-apt-config_0.8.12-1_all.deb
echo "\n"
echo "|----------------------------------------------------------------------------------------------|"
echo "##### => Atualizando a lista de dependencia."
echo "|----------------------------------------------------------------------------------------------|"
apt-get update
echo "\n"
echo "|----------------------------------------------------------------------------------------------|"
echo "##### => Instalando o MySQL."
echo "|----------------------------------------------------------------------------------------------|"
#apt-get install -y mysql-server
sudo apt install -f mysql-client=5.7* mysql-community-server=5.7* mysql-server=5.7*
echo "|----------------------------------------------------------------------------------------------|"
echo "##### => DIGITE A SENHA DO USUARIO ROOT DO MySQL."
echo "|----------------------------------------------------------------------------------------------|"
mysql_upgrade -u root -p --force
service mysql stop
usermod -d /var/lib/mysql/ mysql
sudo echo ' ' >> /etc/mysql/mysql.cnf
sudo echo '[mysqld]' >> /etc/mysql/mysql.cnf
sudo echo '#sql_mode=ONLY_FULL_GROUP_BY,NO_ZERO_IN_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' >> /etc/mysql/mysql.cnf
sudo echo '#bind-address = ::ffff:127.0.0.1' >> /etc/mysql/mysql.cnf
sudo echo '#local-infile=0' >> /etc/mysql/mysql.cnf
sudo echo ' ' >> /etc/mysql/mysql.cnf
sudo echo '# Important: remove limitation of group by with the following line' >> /etc/mysql/mysql.cnf
sudo echo 'sql_mode = ""' >> /etc/mysql/mysql.cnf
service mysql start
rm -rf mysql*.deb
echo "\n"
echo "#=========================== FIM DO SCRIPT ===================================="
echo "\n\n"
exit 
