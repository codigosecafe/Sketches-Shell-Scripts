#!/bin/bash
echo "\n\n"
echo "#=============================================================================="
echo "# title       : UNINSTALL Apache2"
echo "# description : Script para remover do Apache2"
echo "# author      : Claudio Alexssandro Lino"
echo "# github      : https://github.com/codigosecafe"
echo "# version     : 1.0.0"
echo "#=============================================================================="
echo "\n"

cd ~/
apt-get purge `dpkg -l | grep apache2| awk '{print $2}' |tr "\n" " "` -y
apt-get autoremove "apache2*"
rm -rf /etc/apache2 
echo "\n"
echo "#=========================== FIM DO SCRIPT ===================================="
echo "\n\n"
exit 