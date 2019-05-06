#!/bin/bash
echo "\n\n"
echo "#=============================================================================="
echo "# title       : LAMP UBUNTU >= 16 PHP7.1"
echo "# description : INSTALANDO O AMBIENTE PARA DESENVOLVIMENTO LINUX APACHE MySQL PHP (LAMP)."
echo "# author      : Claudio Alexssandro Lino"
echo "# site        : http://cecdigitalmaker.com.br"
echo "# github      : https://github.com/codigosecafe"
echo "# date        : 25/07/2018"
echo "# version     : 3.2"
echo "#=============================================================================="
echo "\n"

echo "|----------------------------------------------------|"
echo "##### => Lendo e atualizando os pacotes do sistema"
echo "|----------------------------------------------------|"
sudo apt-get update 
sudo apt-get -y upgrade 
echo "\n"
echo "|----------------------------------------------------|"
echo "##### => Atualizando a distribução do sistema"
echo "|----------------------------------------------------|"
sudo apt-get -y dist-upgrade
echo "\n"
echo "|----------------------------------------------------------------------------------------------|"
echo "##### => Instalando alguns pacotes que serão necessários para realizar nossa configuração."
echo "|----------------------------------------------------------------------------------------------|"
sudo apt --fix-broken install python-pycurl python-apt
sudo apt-get install -y software-properties-common build-essential libssl-dev
sudo apt-get install -y curl unzip mcrypt git lynx vim aptitude
echo "\n"
echo "|----------------------------------------------------|"
echo "##### => instalando MySQL 5.7"
echo "|----------------------------------------------------|"
cd ~/
env -i wget https://dev.mysql.com/get/mysql-apt-config_0.8.13-1_all.deb
env -i sudo dpkg -i mysql-apt-config_0.8.13-1_all.deb
sudo apt-get update
sudo apt-get install -y mysql-server
env -i mysql_upgrade -u root -p --force
sudo service mysql stop
sudo usermod -d /var/lib/mysql/ mysql
sudo service mysql start
#env -i sudo apt-get install mysql-server mysql-client -y
echo "\n"
echo "|----------------------------------------------------|"
echo "##### => Instalando o Apache"
echo "|----------------------------------------------------|"
sudo aptitude install apache2 -y
sudo vim /etc/apache2/envvars
echo "##### => MELHORANDO SEGURANÇA DO APACHE"
sudo vim /etc/apache2/conf-available/security.conf
env -i sudo a2enmod rewrite 
env -i sudo a2enmod deflate
env -i sudo /etc/init.d/apache2 restart
echo "\n"
echo "|----------------------------------------------------|"
echo "##### => Instalando o PHP 7.1"
echo "|----------------------------------------------------|"
sudo aptitude install -y software-properties-common
sudo add-apt-repository -y ppa:ondrej/php
sudo aptitude update -y
sudo apt-cache pkgnames | grep php7.1
sudo aptitude install php7.1 php7.1-common php-pear -y
sudo aptitude install php7.1-cli php7.1-gd libapache2-mod-php7.1 php7.1-mysql php7.1-curl php7.1-json php-memcached php7.1-dev php7.1-mcrypt php7.1-sqlite3 php7.1-mbstring php7.1-zip php7.1-xml -y
sudo apt-cache pkgnames | grep php7.1
sudo a2dismod php7.2 
sudo a2enmod php7.1 
sudo update-alternatives --set php /usr/bin/php7.1  
php -i | grep /etc/php/7.1/apache2/php.ini
php --ini
sudo /etc/init.d/apache2 restart
echo "\n"
echo "|----------------------------------------------------|"
echo "##### => Instalar o Composer"
echo "|----------------------------------------------------|"
cd ~/
env -i curl -sS https://getcomposer.org/installer | php
env -i sudo mv composer.phar /usr/local/bin/composer
echo "\n"
sudo apt-get update 
sudo apt-get -y upgrade 
sudo apt-get -y clean
sudo apt-get -y autoclean
echo "\n"
echo "#=============================================================================="
echo "# ADICIONANDO MODELO PADROA PARA VHOST"
echo "#=============================================================================="
cd ~/
env -i echo '<VirtualHost *:80>
        ServerAdmin webmaster@localhost

        ServerName dev.padrao
         DocumentRoot /var/www/padrao/public

        <Directory /var/www/padrao/public>
                Options Indexes FollowSymLinks MultiViews
                AllowOverride All
                Order allow,deny
                allow from all

                SetOutputFilter DEFLATE
                AddOutputFilterByType DEFLATE text/html
                AddOutputFilterByType DEFLATE text/plain
                AddOutputFilterByType DEFLATE text/xml
                AddOutputFilterByType DEFLATE text/css
                AddOutputFilterByType DEFLATE text/javascript
                AddOutputFilterByType DEFLATE application/javascript
                AddOutputFilterByType DEFLATE application/xhtml+xml
                AddOutputFilterByType DEFLATE application/xml
                AddOutputFilterByType DEFLATE application/rss+xml
                AddOutputFilterByType DEFLATE application/atom_xml
                AddOutputFilterByType DEFLATE application/x-javascript
                AddOutputFilterByType DEFLATE application/x-httpd-php
                AddOutputFilterByType DEFLATE application/x-httpd-fastphp
                AddOutputFilterByType DEFLATE application/x-httpd-eruby
                AddOutputFilterByType DEFLATE image/svg+xml 
                AddOutputFilterByType DEFLATE text/plain
    			AddOutputFilterByType DEFLATE application/json
    			AddOutputFilterByType DEFLATE font/otf
    			AddOutputFilterByType DEFLATE font/ttf

        </Directory>

        ErrorLog ${APACHE_LOG_DIR}/padrao_error.log
        CustomLog ${APACHE_LOG_DIR}/padrao_access.log combined

</VirtualHost>' > ~/padraoCECSERVER.conf
env -i sudo mv padraoCECSERVER.conf /etc/apache2/sites-available/

echo "\n"
echo "#=============================================================================="
echo "# AMBIENTE DE DESENVOLVIMENTO CRIADO"
echo "#=============================================================================="

env -i echo '<?php phpinfo(); ?>' > /var/www/html/cecphp.php
echo "# visualizar PHP INFO:   http://localhost/cecphp.php"

apache2 -v
php -v
mysql -V
echo "\n"
echo "#=========================== FIM DO SCRIPT ===================================="
echo "\n\n"
