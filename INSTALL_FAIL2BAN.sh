#!/bin/bash
echo "\n\n"
echo "#=============================================================================="
echo "# title       : INSTALL FAIL2BAN"
echo "# description : INSTALL FAIL2BAN."
echo "# author      : Claudio Alexssandro Lino"
echo "# site        : http://codigosecafe.com.br"
echo "# github      : https://github.com/codigosecafe"
echo "# date        : 18/01/2018"
echo "# version     : 1.0"
echo "#=============================================================================="
echo "\n"
echo "##### => Lendo os pacotes disponiveis"
sudo apt-get update
echo "\n"
echo "##### => Atulizando a lista de pacotes"
sudo apt-get upgrade -y
echo "# => instalando aptitude "
sudo apt-get install -y aptitude
echo "\n"
echo "# => instalando FAIL2BAN "
sudo aptitude install fail2ban
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

sudo vim /etc/fail2ban/jail.local

sudo systemctl service enable fail2ban
sudo systemctl service start fail2ban
fail2ban-client restart
fail2ban-client status
#sudo sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf
#sudo /etc/init.d/mysql restart

echo "\n"
echo "#=========================== FIM DO SCRIPT ===================================="
echo "\n\n"