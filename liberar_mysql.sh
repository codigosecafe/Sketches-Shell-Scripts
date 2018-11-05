#!/bin/bash
echo "\n\n"
echo "#=============================================================================="
echo "# title       : Liberar mysql"
echo "# description : Liberando acesso remoto ao MySQL."
echo "# author      : Claudio Alexssandro Lino"
echo "# site        : http://codigosecafe.com.br"
echo "# github      : https://github.com/codigosecafe"
echo "# date        : 18/01/2018"
echo "# version     : 1.0"
echo "#=============================================================================="
echo "\n"
sudo sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf
sudo /etc/init.d/mysql restart

echo "\n"
echo "#=========================== FIM DO SCRIPT ===================================="
echo "\n\n"