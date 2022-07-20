#!/bin/bash
echo "\n\n"
echo "#=============================================================================="
echo "# title       : SET CONFIG TO MYSQL.CNF MYSQL 5.7"
echo "# description : Script para definir mysql.cnf do MySQL 5.7"
echo "# author      : Claudio Alexssandro Lino"
echo "# github      : https://github.com/codigosecafe"
echo "# version     : 1.0.0"
echo "#=============================================================================="
echo "\n"
echo "|----------------------------------------------------------------------------------------------|"
echo "##### => SET CONFIG TO MYSQL.CNF MYSQL 5.7"
echo "|----------------------------------------------------------------------------------------------|"

sudo /etc/init.d/mysql stop
sudo echo ' ' >> /etc/mysql/mysql.cnf
sudo echo '[mysqld]' >> /etc/mysql/mysql.cnf
sudo echo '#sql_mode=ONLY_FULL_GROUP_BY,NO_ZERO_IN_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' >> /etc/mysql/mysql.cnf
sudo echo '#bind-address=0.0.0.0' >> /etc/mysql/mysql.cnf
sudo echo '#local-infile=0' >> /etc/mysql/mysql.cnf
sudo echo ' ' >> /etc/mysql/mysql.cnf
sudo echo '# Important: remove limitation of group by with the following line' >> /etc/mysql/mysql.cnf
sudo echo 'sql_mode = ""' >> /etc/mysql/mysql.cnf
sudo /etc/init.d/mysql start

echo "\n"
echo "#=========================== FIM DO SCRIPT ===================================="
echo "\n\n"
exit 
