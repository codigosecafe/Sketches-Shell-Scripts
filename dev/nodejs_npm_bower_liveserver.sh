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
echo "|----------------------------------------------------|"
echo "##### => Instalando NodeJS"
echo "|----------------------------------------------------|"
env -i curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
env -i sudo apt-get install -y nodejs
env -i sudo npm i -g npm
echo "\n"
echo "|----------------------------------------------------|"
echo "##### => Instalando Bower"
echo "|----------------------------------------------------|"
env -i sudo npm install -y -g bower
echo "\n"
echo "|----------------------------------------------------|"
echo "##### => Instalando Live server"
echo "|----------------------------------------------------|"
env -i sudo npm install live-server -g

echo "\n"
echo "#=============================================================================="
echo "# AMBIENTE DE DESENVOLVIMENTO CRIADO"
echo "#=============================================================================="

env -i node --version
env -i npm --version

echo "\n"
echo "#=========================== FIM DO SCRIPT ===================================="
echo "\n\n"
