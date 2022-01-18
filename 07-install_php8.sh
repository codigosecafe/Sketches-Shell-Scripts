#!/bin/bash
echo "\n\n"
echo "#=============================================================================="
echo "# title       : INSTALL PHP8.0"
echo "# description : Script para instalacao do PHP8.0"
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
sudo apt search php8.0-*
apt-cache pkgnames | grep php8.0
apt install php8.0 php8.0-common php-pear libphp8.0-embed -y
apt install php8.0-bz2 php8.0-cgi php8.0-cli php8.0-dba php8.0-dev -y
apt install php8.0-bcmath php8.0-fpm php8.0-gmp php8.0-mysql php8.0-mysqli php8.0-tidy -y
apt install php8.0-sqlite3 php8.0-json php8.0-opcache php8.0-sybase php8.0-curl -y
apt install php8.0-ldap php8.0-phpdbg php8.0-imap php8.0-xml php8.0-xsl php8.0-intl -y
apt install php8.0-zip php8.0-odbc php8.0-mbstring php8.0-readline php8.0-gd php8.0-interbase -y
apt install php8.0-snmp php8.0-xmlrpc php8.0-soap php8.0-pspell php8.0-pgsql php8.0-enchant php8.0-recode php8.0-redis -y
apt install libapache2-mod-php8.0 -y
apt-cache pkgnames | grep php8.0
a2enmod php8.0 
update-alternatives --set php /usr/bin/php8.0  
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