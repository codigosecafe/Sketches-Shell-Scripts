#!/bin/bash
echo "\n\n"
echo "#=============================================================================="
echo "# title       : INSTALL PHP7.2"
echo "# description : Script para instalacao do PHP7.2"
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
apt-cache pkgnames | grep php7.2
apt install php7.2 php7.2-common php-pear libphp7.2-embed -y
apt install php7.2-bz2 php7.2-cgi php7.2-cli php7.2-dba php7.2-dev -y
apt install php7.2-bcmath php7.2-fpm php7.2-gmp php7.2-mysql php7.2-mysqli php7.2-tidy -y
apt install php7.2-sqlite3 php7.2-json php7.2-opcache php7.2-sybase php7.2-curl -y
apt install php7.2-ldap php7.2-phpdbg php7.2-imap php7.2-xml php7.2-xsl php7.2-intl -y
apt install php7.2-zip php7.2-odbc php7.2-mbstring php7.2-readline php7.2-gd php7.2-interbase -y
apt install php7.2-snmp php7.2-xmlrpc php7.2-soap php7.2-pspell php7.2-pgsql php7.2-enchant php7.2-recode php7.2-redis -y
apt-cache pkgnames | grep php7.2
a2enmod php7.2 
update-alternatives --set php /usr/bin/php7.2  
php -i | grep /etc/php/7.2/apache2/php.ini
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
