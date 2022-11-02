#!/bin/bash
echo "\n\n"
echo "#=============================================================================="
echo "# title       : CONFIG XDEBUG PHP7.3"
echo "# description : Script para instalacao do PHP7.3"
echo "# author      : Claudio Alexssandro Lino"
echo "# github      : https://github.com/codigosecafe"
echo "# version     : 1.0.0"
echo "#=============================================================================="
echo "\n"

cd ~/
echo 'zend_extension=$(find /usr/lib/php -name xdebug.so -type f -printf "%p\n" | sort -n | tail -1)' > /etc/php/7.3/cli/conf.d/20-xdebug.ini
echo '#xdebug.mode=coverage' >> /etc/php/7.3/cli/conf.d/20-xdebug.ini
echo 'xdebug.mode=debug' >> /etc/php/7.3/cli/conf.d/20-xdebug.ini
echo 'xdebug.start_with_request=Yes' >> /etc/php/7.3/cli/conf.d/20-xdebug.ini
echo 'xdebug.client_port=9003' >> /etc/php/7.3/cli/conf.d/20-xdebug.ini
echo 'xdebug.remote_autostart=1' >> /etc/php/7.3/cli/conf.d/20-xdebug.ini
echo ';xdebug.client_host=127.0.0.1' >> /etc/php/7.3/cli/conf.d/20-xdebug.ini
echo 'xdebug.discover_client_host=true' >> /etc/php/7.3/cli/conf.d/20-xdebug.ini
echo 'xdebug.log_level=0' >> /etc/php/7.3/cli/conf.d/20-xdebug.ini
echo "\n"
echo "#=========================== FIM DO SCRIPT ===================================="
echo "\n\n"
exit 