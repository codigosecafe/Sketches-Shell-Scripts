#!/bin/bash
echo "\n\n"
echo "#=============================================================================="
echo "# title       : INSTALL php8.4"
echo "# description : Script para instalacao do php8.4"
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
sudo apt search php8.4
apt-cache pkgnames | grep php8.4
apt install php8.4 -y
apt install php8.4-common -y
apt install php-pear -y
apt install php8.4-bz2 -y
apt install php8.4-cgi -y
apt install php8.4-cli -y
apt install php8.4-dba -y
apt install php8.4-dev -y
apt install php8.4-bcmath -y
apt install php8.4-fpm -y
apt install php8.4-gmp -y
apt install php8.4-mysql -y
apt install php8.4-mysqli -y
apt install php8.4-tidy -y
apt install php8.4-sqlite3 -y
apt install php8.4-json -y
apt install php8.4-opcache -y
apt install php8.4-sybase -y
apt install php8.4-curl -y
apt install php8.4-ldap -y
apt install php8.4-phpdbg -y
apt install php8.4-imap -y
apt install php8.4-xml -y
apt install php8.4-xsl -y
apt install php8.4-intl -y
apt install php8.4-zip -y
apt install php8.4-odbc -y
apt install php8.4-mbstring -y
apt install php8.4-readline -y
apt install php8.4-gd -y
apt install php8.4-interbase -y
apt install php8.4-snmp -y
apt install php8.4-xmlrpc -y
apt install php8.4-soap -y
apt install php8.4-pspell -y
apt install php8.4-pgsql -y
apt install php8.4-enchant -y
apt install php8.4-recode -y
apt install libapache2-mod-php8.4 -y
apt-cache pkgnames | grep php8.4 | xargs sudo apt install -y
a2enmod php8.4 
update-alternatives --set php /usr/bin/php8.4  
php -i | grep /etc/php/8.0/apache2/php.ini
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