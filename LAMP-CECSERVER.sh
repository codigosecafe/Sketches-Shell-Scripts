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
env -i sudo apt-get -y upgrade 
echo "# => instalando aptitude "
env -i sudo apt-get install -y aptitude
echo "\n"
echo "|----------------------------------------------------|"
echo "##### => Atualizando a distribução do sistema"
echo "|----------------------------------------------------|"
env -i sudo apt-get -y dist-upgrade
echo "\n"
echo "|----------------------------------------------------------------------------------------------|"
echo "##### => Instalando alguns pacotes que serão necessários para realizar nossa configuração."
echo "|----------------------------------------------------------------------------------------------|"
env -i sudo aptitude install -y software-properties-common python-software-properties build-essential libssl-dev libmaxminddb-dev libncursesw5-dev libglib2.0-dev libgeoip-dev libtokyocabinet-dev
env -i sudo aptitude install -y curl unzip mcrypt git lynx vim 
env -i sudo set -gx TERM "xterm-256color" set -xU LSCOLORS 'di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'
env -i sudo export TERM=xterm-256color
echo "\n"
echo "|----------------------------------------------------|"
echo "##### => instalando MySQL"
echo "|----------------------------------------------------|"
env -i sudo aptitude install mysql-server mysql-client -y
echo "\n"
echo "|----------------------------------------------------|"
echo "##### => Instalando o Apache"
echo "|----------------------------------------------------|"
env -i sudo aptitude install apache2 -y
echo "##### => MELHORANDO SEGURANÇA DO APACHE"
env -i sudo vim /etc/apache2/conf-available/security.conf
env -i sudo a2enmod rewrite 
env -i sudo a2enmod deflate
env -i sudo /etc/init.d/apache2 restart
echo "\n"
echo "|----------------------------------------------------|"
echo "##### => Instalando o PHP 7.1"
echo "|----------------------------------------------------|"
env -i sudo LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php -y
env -i sudo aptitude update
env -i sudo aptitude install php7.1 php7.1-common -y
env -i sudo aptitude install php7.1-cli php7.1-gd libapache2-mod-php7.1 php7.1-mysql php7.1-curl php7.1-json php-memcached php7.1-dev php7.1-mcrypt php7.1-sqlite3 php7.1-mbstring php7.1-zip php7.1-xml -y
env -i sudo apt-cache search php7.1
env -i php --ini
env -i sudo /etc/init.d/apache2 restart
echo "\n"
echo "|----------------------------------------------------|"
echo "##### => Instalar o Composer"
echo "|----------------------------------------------------|"

env -i curl -sS https://getcomposer.org/installer | php
env -i sudo mv composer.phar /usr/local/bin/composer
echo "\n"
# Opcional
echo "instalando o phpMyAdmin"
env -i sudo aptitude update
env -i sudo aptitude install phpmyadmin php-mbstring php-gettext
env -i sudo phpenmod mcrypt
env -i sudo phpenmod mbstring
env -i sudo systemctl restart apache2



env -i sudo aptitude update 
env -i sudo aptitude -y upgrade 
env -i sudo aptitude -y clean
env -i sudo aptitude -y autoclean
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
env -i xdg-open http://localhost/cecphp.php
env -i lynx http://localhost/cecphp.php
env -i apache2 -v
env -i php -v
env -i mysql -V
echo "\n"
echo "#=========================== FIM DO SCRIPT ===================================="
echo "\n\n"