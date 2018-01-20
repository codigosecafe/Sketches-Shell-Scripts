#!/bin/bash
echo "\n\n"
echo "#=============================================================================="
echo "# title       : NODEJS NPM BOWER LIVESERVER"
echo "# description : AMBIENTE DE DESENVOLVIMENTO FRONT-END."
echo "# author      : Claudio Alexssandro Lino"
echo "# site        : http://codigosecafe.com.br"
echo "# github      : https://github.com/codigosecafe"
echo "# date        : 18/01/2018"
echo "# version     : 1.0"
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
echo "|----------------------------------------------------|"
echo "##### => Instalando NodeJS"
echo "|----------------------------------------------------|"
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm i -g npm
echo "\n"
echo "|----------------------------------------------------|"
echo "##### => Instalando Bower"
echo "|----------------------------------------------------|"
sudo npm install -y -g bower
echo "\n"
echo "|----------------------------------------------------|"
echo "##### => Instalando Live server"
echo "|----------------------------------------------------|"
sudo npm install live-server -g

echo "\n"
echo "#=============================================================================="
echo "# AMBIENTE DE DESENVOLVIMENTO CRIADO"
echo "#=============================================================================="

node --version
npm --version

echo "\n"
echo "#=========================== FIM DO SCRIPT ===================================="
echo "\n\n"
