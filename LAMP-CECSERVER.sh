#!/bin/bash
echo "\n\n"
echo "#=============================================================================="
echo "# title       : LAMP UBUNTU >= 16 "
echo "# description : INSTALANDO O AMBIENTE PARA DESENVOLVIMENTO PHP."
echo "# author      : Claudio Alexssandro Lino"
echo "# site        : http://cecdigitalmaker.com.br"
echo "# github      : https://github.com/codigosecafe"
echo "# date        : 10/02/2018"
echo "# version     : 2.6"
echo "#=============================================================================="
echo "\n"
cd ~/
echo "|----------------------------------------------------|"
echo "##### => Lendo e atualizando os pacotes do sistema"
echo "|----------------------------------------------------|"
env -i sudo apt-get update 
env -i sudo apt-get -y upgrade 

echo "\n"
echo "|----------------------------------------------------|"
echo "##### => Atualizando a distribução do sistema"
echo "|----------------------------------------------------|"
env -i sudo apt-get -y dist-upgrade
echo "\n"
echo "|----------------------------------------------------------------------------------------------|"
echo "##### => Instalando alguns pacotes que serão necessários para realizar nossa configuração."
echo "|----------------------------------------------------------------------------------------------|"
env -i sudo apt-get install -y software-properties-common python-software-properties build-essential libssl-dev
env -i sudo apt-get install -y curl unzip mcrypt git lynx vim
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

env -i sudo apt-get install mysql-server mysql-client -y
echo "\n"
echo "|----------------------------------------------------|"
echo "##### => Instalando o Apache"
echo "|----------------------------------------------------|"
env -i sudo apt-get install apache2 -y
#echo "##### => MELHORANDO SEGURANÇA DO APACHE"
sudo vim /etc/apache2/conf-available/security.conf
sudo a2enmod rewrite 
sudo a2enmod deflate
sudo /etc/init.d/apache2 restart
echo "|----------------------------------------------------|"
echo "##### => Instalando o PHP 7.0"
echo "|----------------------------------------------------|"
cd ~/
env -i sudo apt-get install php7.0 php7.0-common -y
env -i sudo apt-get install php7.0-cli php7.0-gd libapache2-mod-php7.0 php7.0-cgi php7.0-mysql php-pear php7.0-curl php7.0-json php-memcached php7.0-dev php7.0-mcrypt php7.0-sqlite3 php7.0-mbstring php7.0-zip php7.0-xml -y
sudo apt-cache search php7.0
env -i php --ini
sudo /etc/init.d/apache2 restart
echo "|----------------------------------------------------|"
echo "##### => Instalar o Composer"
echo "|----------------------------------------------------|"
cd ~/
env -i curl -sS https://getcomposer.org/installer | php
env -i sudo mv composer.phar /usr/local/bin/composer
echo "\n"
echo "|----------------------------------------------------|"
echo "##### => instalando o phpMyAdmin"
echo "|----------------------------------------------------|"
cd ~/
env -i sudo apt-get install phpmyadmin -y
env -i sudo phpenmod mcrypt
env -i sudo phpenmod mbstring
sudo /etc/init.d/apache2 restart
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
echo "\n"
cd ~/
env -i sudo apt-get update 
env -i sudo apt-get upgrade -y
env -i sudo apt-get clean -y
env -i sudo apt-get autoclean -y
echo "\n"
env -i echo '<?php phpinfo(); ?>' > ~/cecphp.php
env -i sudo mv cecphp.php /var/www/html/
apache2 -v
php -v
mysql -V
sudo cat /dev/null > ~/.bash_history
echo "\n"
echo "#=========================== FIM DO SCRIPT ===================================="
echo "\n\n"