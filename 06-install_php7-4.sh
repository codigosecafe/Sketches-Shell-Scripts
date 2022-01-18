#!/bin/bash
echo "\n\n"
echo "#=============================================================================="
echo "# title       : INSTALL PHP7.4"
echo "# description : Script para instalacao do PHP7.4"
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
apt-cache pkgnames | grep php7.4
apt install php7.4 php7.4-common php-pear libphp7.4-embed -y
apt install php7.4-bz2 php7.4-cgi php7.4-cli php7.4-dba php7.4-dev -y
apt install php7.4-bcmath php7.4-fpm php7.4-gmp php7.4-mysql php7.4-mysqli php7.4-tidy -y
apt install php7.4-sqlite3 php7.4-json php7.4-opcache php7.4-sybase php7.4-curl -y
apt install php7.4-ldap php7.4-phpdbg php7.4-imap php7.4-xml php7.4-xsl php7.4-intl -y
apt install php7.4-zip php7.4-odbc php7.4-mbstring php7.4-readline php7.4-gd php7.4-interbase -y
apt install php7.4-snmp php7.4-xmlrpc php7.4-soap php7.4-pspell php7.4-pgsql php7.4-enchant php7.4-recode php7.4-redis -y
apt-cache pkgnames | grep php7.4
a2enmod php7.4 
update-alternatives --set php /usr/bin/php7.4  
php -i | grep /etc/php/7.4/apache2/php.ini
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