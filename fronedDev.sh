#!/bin/sh
echo "\n\n"
echo "#=============================================================================="
echo "# title       : NBG"
echo "# description : AMBIENTE DE DESENVOLVIMENTO FRONT-END."
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
echo "##### => Instalando NodeJS"
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm i -g npm
echo "\n"
echo "##### => Instalando Bower"
sudo npm install -y -g bower
echo "\n"
echo "##### => Instalando Live server"
sudo npm install live-server -g

echo "\n"
echo "#=============================================================================="
echo "# AMBIENTE DE DESENVOLVIMENTO CRIADO"
echo "#=============================================================================="

node --version
npm --version


echo "\n\n"