#!/bin/bash
echo "\n\n"
echo "#=============================================================================="
echo "# title       : UNINSTALL PHP"
echo "# description : Script para remover do PHP"
echo "# author      : Claudio Alexssandro Lino"
echo "# github      : https://github.com/codigosecafe"
echo "# version     : 1.0.0"
echo "#=============================================================================="
echo "\n"

cd ~/
apt-get purge `dpkg -l | grep php| awk '{print $2}' |tr "\n" " "` -y
apt purge 'libapache2-mod-php*' -y
apt-get autoremove "php7*"
rm -rf /etc/php
/etc/init.d/apache2 restart
echo "\n"
echo "#=========================== FIM DO SCRIPT ===================================="
echo "\n\n"
exit 