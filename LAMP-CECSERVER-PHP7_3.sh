#!/bin/bash
echo "\n\n"
echo "#=============================================================================="
echo "# title       : LAMP UBUNTU >= 18 PHP7.3"
echo "# description : INSTALANDO O AMBIENTE PARA DESENVOLVIMENTO PHP."
echo "# author      : Claudio Alexssandro Lino"
echo "# site        : http://cecdigitalmaker.com.br"
echo "# github      : https://github.com/codigosecafe"
echo "# date        : 11/02/2018"
echo "# version     : 3.1"
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
env -i sudo apt-get install -y curl unzip mcrypt git lynx vim aptitude
echo "\n"

echo "|----------------------------------------------------|"
echo "##### => Instalando o PHP 7.3"
echo "|----------------------------------------------------|"
sudo aptitude install -y software-properties-common
sudo add-apt-repository -y ppa:ondrej/php
sudo aptitude update -y
sudo apt-cache pkgnames | grep php7.3
sudo aptitude install php7.3 php7.3-common php-pear -y
sudo aptitude install php7.3-cli php7.3-gd libapache2-mod-php7.3 php7.3-mysql php7.3-curl php7.3-json php-memcached php7.3-dev php7.3-mcrypt php7.3-sqlite3 php7.3-mbstring php7.3-zip php7.3-xml -y
sudo apt-cache pkgnames | grep php7.3
sudo a2dismod php7.3 
sudo a2enmod php7.3 
sudo update-alternatives --set php /usr/bin/php7.3  
php -i | grep /etc/php/7.3/apache2/php.ini
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
env -i sudo apt-get update 
env -i sudo apt-get -y upgrade 
env -i sudo apt-get -y clean
env -i sudo apt-get -y autoclean
echo "\n"

php -v

echo "\n"
echo "#=========================== FIM DO SCRIPT ===================================="
echo "\n\n"