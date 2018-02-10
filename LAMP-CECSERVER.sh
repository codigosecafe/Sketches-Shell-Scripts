#!/bin/bash
echo "\n\n"
echo "#=============================================================================="
echo "# title       : LAMP UBUNTU >= 16 "
echo "# description : INSTALANDO O AMBIENTE PARA DESENVOLVIMENTO PHP."
echo "# author      : Claudio Alexssandro Lino"
echo "# site        : http://cecdigitalmaker.com.br"
echo "# github      : https://github.com/codigosecafe"
echo "# date        : 10/02/2018"
echo "# version     : 2.5"
echo "#=============================================================================="
echo "\n"
cd ~/
echo "|----------------------------------------------------|"
echo "##### => Lendo e atualizando os pacotes do sistema"
echo "|----------------------------------------------------|"
env -i sudo apt-get update 
env -i sudo apt-get --assume-yes --force-yes upgrade 

echo "\n"
echo "|----------------------------------------------------|"
echo "##### => Atualizando a distribução do sistema"
echo "|----------------------------------------------------|"
env -i sudo apt-get --assume-yes --force-yes dist-upgrade
echo "\n"
echo "|----------------------------------------------------------------------------------------------|"
echo "##### => Instalando alguns pacotes que serão necessários para realizar nossa configuração."
echo "|----------------------------------------------------------------------------------------------|"
env -i sudo apt-get install --assume-yes --force-yes software-properties-common python-software-properties build-essential libssl-dev
env -i sudo apt-get install --assume-yes --force-yes curl unzip mcrypt git lynx vim
echo "\n"
echo "|----------------------------------------------------|"
echo "##### => instalando MySQL"
echo "|----------------------------------------------------|"
echo "\n"
echo "##### => DIGITE UMA SENHA PARA O MySQL e phpMyAdmin: "
read DEFAULTPASS
#DEFAULTPASS="root"
sudo debconf-set-selections <<EOF
mysql-server	mysql-server/root_password password $DEFAULTPASS
mysql-server	mysql-server/root_password_again password $DEFAULTPASS
dbconfig-common	dbconfig-common/mysql/app-pass password $DEFAULTPASS
dbconfig-common	dbconfig-common/mysql/admin-pass password $DEFAULTPASS
dbconfig-common	dbconfig-common/password-confirm password $DEFAULTPASS
dbconfig-common	dbconfig-common/app-password-confirm password $DEFAULTPASS
phpmyadmin		phpmyadmin/reconfigure-webserver multiselect apache2
phpmyadmin		phpmyadmin/dbconfig-install boolean true
phpmyadmin      phpmyadmin/app-password-confirm password $DEFAULTPASS 
phpmyadmin      phpmyadmin/mysql/admin-pass     password $DEFAULTPASS
phpmyadmin      phpmyadmin/password-confirm     password $DEFAULTPASS
phpmyadmin      phpmyadmin/setup-password       password $DEFAULTPASS
phpmyadmin      phpmyadmin/mysql/app-pass       password $DEFAULTPASS
EOF

env -i sudo apt-get install mysql-server mysql-client --assume-yes --force-yes
echo "\n"
echo "|----------------------------------------------------|"
echo "##### => Instalando o Apache"
echo "|----------------------------------------------------|"
env -i sudo apt-get install apache2 --assume-yes --force-yes
#echo "##### => MELHORANDO SEGURANÇA DO APACHE"
sudo vim /etc/apache2/conf-available/security.conf
sudo a2enmod rewrite 
sudo a2enmod deflate
sudo /etc/init.d/apache2 restart

echo "|----------------------------------------------------|"
echo "##### => Instalar o Composer"
echo "|----------------------------------------------------|"
cd ~/
env -i curl -sS https://getcomposer.org/installer | php
env -i sudo mv composer.phar /usr/local/bin/composer
echo "\n"
# Opcional
echo "instalando o phpMyAdmin"
env -i sudo apt-get update
env -i sudo apt-get install dbconfig-common dbconfig-mysql libjs-jquery libjs-sphinxdoc libjs-underscore php-gettext php-mbstring php-pear php-phpseclib php7.2-common php7.2-mbstring dbconfig-common dbconfig-mysql libjs-jquery libjs-sphinxdoc libjs-underscore php-gettext php-mbstring php-pear php-phpseclib php7.2-common php7.2-mbstring phpmyadmin --assume-yes --force-yes
env -i sudo apt-get install php-mbstring php-gettext javascript-common php-libsodium php-gmp --assume-yes --force-yes
env -i sudo apt-get install phpmyadmin --assume-yes --force-yes
env -i sudo phpenmod mcrypt
env -i sudo phpenmod mbstring
sudo /etc/init.d/apache2 restart
echo "\n"
echo "|----------------------------------------------------|"
echo "##### => Instalando o PHP 7.1"
echo "|----------------------------------------------------|"
sudo LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php --assume-yes --force-yes
cd ~/
env -i sudo apt-get update
env -i sudo apt-get install php7.1 php7.1-common --assume-yes --force-yes
env -i sudo apt-get install php7.1-cli php7.1-gd libapache2-mod-php7.1 php7.1-mysql php7.1-curl php7.1-json php-memcached php7.1-dev php7.1-mcrypt php7.1-sqlite3 php7.1-mbstring php7.1-zip php7.1-xml --assume-yes --force-yes

sudo apt-cache search php7.1
env -i php --ini
sudo /etc/init.d/apache2 restart
echo "\n"
cd ~/
env -i sudo apt-get update 
env -i sudo apt-get --assume-yes --force-yes upgrade 
env -i sudo apt-get --assume-yes --force-yes clean
env -i sudo apt-get --assume-yes --force-yes autoclean
echo "\n"
echo "#=============================================================================="
echo "# ADICIONANDO MODELO PADROA PARA VHOST"
echo "#=============================================================================="
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

env -i echo '<?php phpinfo(); ?>' > ~/cecphp.php
env -i sudo mv cecphp.php /var/www/html/
xdg-open http://localhost/cecphp.php
lynx http://localhost/cecphp.php
apache2 -v
php -v
mysql -V
echo "\n"
echo "#=========================== FIM DO SCRIPT ===================================="
echo "\n\n"