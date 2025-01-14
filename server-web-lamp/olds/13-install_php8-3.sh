#!/bin/bash
echo "\n\n"
echo "#=============================================================================="
echo "# title       : INSTALL php8.3"
echo "# description : Script para instalacao do php8.3"
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
sudo apt search php8.3
apt-cache pkgnames | grep php8.3
apt install php8.3 -y
apt install php8.3-common -y
apt install php-pear -y
apt install php8.3-bz2 -y
apt install php8.3-cgi -y
apt install php8.3-cli -y
apt install php8.3-dba -y
apt install php8.3-dev -y
apt install php8.3-bcmath -y
apt install php8.3-fpm -y
apt install php8.3-gmp -y
apt install php8.3-mysql -y
apt install php8.3-mysqli -y
apt install php8.3-tidy -y
apt install php8.3-sqlite3 -y
apt install php8.3-json -y
apt install php8.3-opcache -y
apt install php8.3-sybase -y
apt install php8.3-curl -y
apt install php8.3-ldap -y
apt install php8.3-phpdbg -y
apt install php8.3-imap -y
apt install php8.3-xml -y
apt install php8.3-xsl -y
apt install php8.3-intl -y
apt install php8.3-zip -y
apt install php8.3-odbc -y
apt install php8.3-mbstring -y
apt install php8.3-readline -y
apt install php8.3-gd -y
apt install php8.3-interbase -y
apt install php8.3-snmp -y
apt install php8.3-xmlrpc -y
apt install php8.3-soap -y
apt install php8.3-pspell -y
apt install php8.3-pgsql -y
apt install php8.3-enchant -y
apt install php8.3-recode -y
apt install libapache2-mod-php8.3 -y
apt-cache pkgnames | grep php8.3 | xargs sudo apt install -y
a2enmod php8.3 
update-alternatives --set php /usr/bin/php8.3  
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