#!/bin/bash
echo "\n\n"
echo "#=============================================================================="
echo "# title       : INSTALL PHP7.8"
echo "# description : Script para instalacao do PHP7.8"
echo "# author      : Claudio Alexssandro Lino"
echo "# github      : https://github.com/codigosecafe"
echo "# version     : 1.0.0"
echo "#=============================================================================="
echo "\n"

cd ~/
apt-get update
aptitude install -y software-properties-common
add-apt-repository -y ppa:ondrej/php
aptitude update -y
apt-cache pkgnames | grep php7.8
apt install php7.8 php7.8-common php-pear libphp7.8-embed -y
apt install php7.8-bz2 php7.8-cgi php7.8-cli php7.8-dba php7.8-dev -y
apt install php7.8-bcmath php7.8-fpm php7.8-gmp php7.8-mysql php7.8-mysqli php7.8-tidy -y
apt install php7.8-sqlite3 php7.8-json php7.8-opcache php7.8-sybase php7.8-curl -y
apt install php7.8-ldap php7.8-phpdbg php7.8-imap php7.8-xml php7.8-xsl php7.8-intl -y
apt install php7.8-zip php7.8-odbc php7.8-mbstring php7.8-readline php7.8-gd php7.8-interbase -y
apt install php7.8-snmp php7.8-xmlrpc php7.8-soap php7.8-pspell php7.8-pgsql php7.8-enchant php7.8-recode php7.8-redis -y
apt-cache pkgnames | grep php7.8
a2enmod php7.8 
update-alternatives --set php /usr/bin/php7.8  
php -i | grep /etc/php/7.8/apache2/php.ini
php --ini
/etc/init.d/apache2 restart
echo "\n"
echo "|----------------------------------------------------|"
echo "##### => Instalar o Composer"
echo "|----------------------------------------------------|"
cd ~/
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
echo "\n"
apt-get update 
apt-get -y upgrade 
apt-get -y clean
apt-get -y autoclean
echo "\n"

echo '<?php phpinfo(); ?>' > /var/www/html/showinfo.php
echo "\n"
echo "#=========================== FIM DO SCRIPT ===================================="
echo "\n\n"
exit 