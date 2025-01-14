#!/bin/bash
echo "\n\n"
echo "#=============================================================================="
echo "# title       : INSTALL MARIADB"
echo "# description : Script para instalação do MariaDB"
echo "# author      : Claudio Alexssandro Lino"
echo "# github      : https://github.com/codigosecafe"
echo "# version     : 1.0.0"
echo "#=============================================================================="
echo "\n"

# Atualiza o sistema
echo "|----------------------------------------------------|"
echo "##### => Atualizando pacotes do sistema"
echo "|----------------------------------------------------|"
sudo apt-get update -y
sudo apt-get upgrade -y
echo "\n"

# Adicionando o repositório oficial do MariaDB
echo "|----------------------------------------------------|"
echo "##### => Adicionando repositório do MariaDB"
echo "|----------------------------------------------------|"
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:mariadb/mariadb-10.5 -y
sudo apt-get update -y
echo "\n"

# Instalando MariaDB
echo "|----------------------------------------------------|"
echo "##### => Instalando MariaDB"
echo "|----------------------------------------------------|"
sudo apt-get install -y mariadb-server mariadb-client
echo "\n"

# Iniciando o serviço MariaDB
echo "|----------------------------------------------------|"
echo "##### => Iniciando o serviço MariaDB"
echo "|----------------------------------------------------|"
sudo systemctl start mariadb
sudo systemctl enable mariadb
echo "\n"

# Configurando a segurança do MariaDB
echo "|----------------------------------------------------|"
echo "##### => Configurando a segurança do MariaDB"
echo "|----------------------------------------------------|"
sudo mysql_secure_installation
echo "\n"

# Verificando a instalação do MariaDB
echo "|----------------------------------------------------|"
echo "##### => Verificando instalação do MariaDB"
echo "|----------------------------------------------------|"
mysql --version
echo "\n"

# Finalização
echo "#=========================== FIM DO SCRIPT ===================================="
echo "\n\n"
exit
