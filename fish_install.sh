#!/bin/bash
echo "Lendo os pacotes disponiveis"
sudo apt-get update
echo "Atulizando a lista de pacotes"
sudo apt-get upgrade -y

echo "Adcionando fish ao sistema"
sudo apt-add-repository ppa:fish-shell/release-2 -y
sudo apt-get update
sudo apt-get install fish -y
echo "Defenindo o fish como padrao"
chsh -s /usr/bin/fish
echo "Iniciando o fish"
fish