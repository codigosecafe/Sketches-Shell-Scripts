#!/bin/bash
echo "\n\n"
echo "#=============================================================================="
echo "# title       : Fish shell"
echo "# description : Instalando uma alternativa configurável e fácil de usar para o Bash."
echo "# author      : Claudio Alexssandro Lino"
echo "# site        : http://codigosecafe.com.br"
echo "# github      : https://github.com/codigosecafe"
echo "# date        : 18/01/2018"
echo "# version     : 1.0.0"
echo "#=============================================================================="
echo "\n"

echo "##### => Lendo os pacotes disponiveis"
sudo apt-get update
echo "\n"
echo "##### => Atulizando a lista de pacotes"
sudo apt-get upgrade -y
echo "# => instalando aptitude "
sudo apt-get install -y aptitude
echo "\n"
echo "##### => Adcionando fish ao sistema"
sudo apt-add-repository ppa:fish-shell/release-2 -y
sudo aptitude update
sudo aptitude install fish -y

echo "\n"
echo "##### => Defenindo o fish como padrao"
sudo chsh -s /usr/bin/fish
echo "\n"
echo "Iniciando o fish"
fish
echo "\n"
echo "#=========================== FIM DO SCRIPT ===================================="
echo "\n\n"
exit 