#!/bin/bash
echo "\n\n"
echo "#=============================================================================="
echo "# title       : INSTALL php8.2"
echo "# description : Script para instalacao do php8.2"
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
sudo apt search php8.2
apt-cache pkgnames | grep php8.2
apt install php8.2 -y
apt install php8.2-common -y
apt install php-pear -y
apt install php8.2-bz2 -y
apt install php8.2-cgi -y
apt install php8.2-cli -y
apt install php8.2-dba -y
apt install php8.2-dev -y
apt install php8.2-bcmath -y
apt install php8.2-fpm -y
apt install php8.2-gmp -y
apt install php8.2-mysql -y
apt install php8.2-mysqli -y
apt install php8.2-tidy -y
apt install php8.2-sqlite3 -y
apt install php8.2-json -y
apt install php8.2-opcache -y
apt install php8.2-sybase -y
apt install php8.2-curl -y
apt install php8.2-ldap -y
apt install php8.2-phpdbg -y
apt install php8.2-imap -y
apt install php8.2-xml -y
apt install php8.2-xsl -y
apt install php8.2-intl -y
apt install php8.2-zip -y
apt install php8.2-odbc -y
apt install php8.2-mbstring -y
apt install php8.2-readline -y
apt install php8.2-gd -y
apt install php8.2-interbase -y
apt install php8.2-snmp -y
apt install php8.2-xmlrpc -y
apt install php8.2-soap -y
apt install php8.2-pspell -y
apt install php8.2-pgsql -y
apt install php8.2-enchant -y
apt install php8.2-recode -y
apt install libapache2-mod-php8.2 -y
apt-cache pkgnames | grep php8.2 | xargs sudo apt install -y
a2enmod php8.2 
update-alternatives --set php /usr/bin/php8.2  
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