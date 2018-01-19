#!/bin/sh
echo "\n\n"
echo "#=============================================================================="
echo "# title       : LAMP"
echo "# description : INSTALANDO O AMBIENTE PARA DESENVOLVIMENTO PHP."
echo "# author      : Claudio Alexssandro Lino"
echo "# site        : http://codigosecafe.com.br"
echo "# github      : https://github.com/codigosecafe"
echo "# date        : 18/01/2018"
echo "# version     : 1.0"
echo "#=============================================================================="
echo "\n"
echo "##### => Lendo e atualizando os pacotes do sistema"
sudo apt-get update 
sudo apt-get -y upgrade 
echo "\n"
echo "##### => Atualizando a distribução do sistema"
sudo apt-get -y dist-upgrade
echo "\n"
echo "##### => Instalando alguns pacotes que serão necessários para realizar nossa configuração."
apt-get install software-properties-common python-software-properties curl unzip
echo "\n"
echo "##### => instalando MySQL"
sudo apt-get install mysql-server -y
echo "\n"
echo "##### => Instalando o Apache"
sudo apt-get install apache2 -y
echo "\n"
echo "##### => Instalando o PHP 7.2"
sudo add-apt-repository -y ppa:ondrej/php 
sudo apt-get update
sudo LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php 
sudo apt-get update
echo "\n"
echo "##### => Instalando o PHP 7.2"
sudo apt-cache search php7.2
sudo apt-get install -y php7.2-cli libapache2-mod-php7.2 php7.2-mysql php7.2-curl php7.2-dev php7.2-mcrypt php7.2-sqlite3 php7.2-mbstring php7.2-gd php7.2-json php7.2-xml php7.2-zip
php --ini
sudo systemctl restart apache2
echo "\n"
echo "##### => Instalar o Composer"
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
echo "\n"
# Opcional
#echo "instalando o phpMyAdmin"
#sudo apt-get install phpmyadmin
echo "\n"
echo "#=============================================================================="
echo "# AMBIENTE DE DESENVOLVIMENTO CRIADO"
echo "#=============================================================================="
apache2 -v
php -v
mysql -V
echo "\n"
echo "#=========================== FIM DO SCRIPT ===================================="
echo "\n\n"