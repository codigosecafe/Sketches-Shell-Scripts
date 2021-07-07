#!/bin/bash
echo "\n\n"
echo "#=============================================================================="
echo "# title       : UPDATE SERVER"
echo "# description : Atualiza server e prepara o ambiente."
echo "# author      : Claudio Alexssandro Lino"
echo "# github      : https://github.com/codigosecafe"
echo "# version     : 1.0.0"
echo "#=============================================================================="
echo "\n"

echo "|----------------------------------------------------|"
echo "##### => Lendo e atualizando os pacotes do sistema"
echo "|----------------------------------------------------|"
apt-get update 
apt-get -y upgrade 
echo "\n"
echo "|----------------------------------------------------|"
echo "##### => Atualizando a distribuição do sistema"
echo "|----------------------------------------------------|"
apt-get -y dist-upgrade
echo "\n"
echo "|----------------------------------------------------------------------------------------------|"
echo "##### => Instalando alguns pacotes que serão necessários para realizar nossa configuração."
echo "|----------------------------------------------------------------------------------------------|"
apt --fix-broken install python-pycurl python-apt aptitude
apt-get install -y software-properties-common build-essential libssl-dev
apt-get install -y curl unzip mcrypt git lynx vim
echo "\n"
echo "#=========================== FIM DO SCRIPT ===================================="
echo "\n\n"