#!/bin/bash
echo "\n\n"
echo "#=============================================================================="
echo "# title       : REMOVE MYSQL 5.7"
echo "# description : Script para remover do MySQL 5.7"
echo "# author      : Claudio Alexssandro Lino"
echo "# github      : https://github.com/codigosecafe"
echo "# version     : 1.0.0"
echo "#=============================================================================="
echo "\n"
echo "|----------------------------------------------------------------------------------------------|"
echo "##### => Removendo todos os pacotes do mysql remanecentes no ambiente."
echo "|----------------------------------------------------------------------------------------------|"
cd ~/
rm -rf mysql*.deb
apt-get remove --purge mysql*
apt-get purge mysql*
apt-get autoremove
apt-get autoclean
apt-get remove dbconfig-mysql
echo "\n"
echo "#=========================== FIM DO SCRIPT ===================================="
echo "\n\n"
exit 