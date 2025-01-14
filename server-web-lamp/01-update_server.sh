#!/bin/bash

#==============================================================================#
# Title       : UPDATE SERVER
# Description : Atualiza servidor e prepara o ambiente.
# Author      : Claudio Alexssandro Lino
# GitHub      : https://github.com/codigosecafe
# Version     : 1.0.1
#==============================================================================#

# Função para exibir uma mensagem com bordas decorativas
print_section() {
    echo -e "\n|----------------------------------------------------|"
    echo -e "$1"
    echo -e "|----------------------------------------------------|\n"
}

# Função para verificar o status de execução do último comando
check_status() {
    if [ $? -eq 0 ]; then
        echo "✅ Operação concluída com sucesso."
    else
        echo "❌ Erro ao executar o comando. Abortando script."
        exit 1
    fi
}

# Início do script
print_section "Iniciando a atualização do servidor"

# Atualizando pacotes do sistema
print_section "Lendo e atualizando os pacotes do sistema"
apt-get update && apt-get -y upgrade
check_status

# Atualizando a distribuição do sistema
print_section "Atualizando a distribuição do sistema"
apt-get -y dist-upgrade
check_status

# Instalando pacotes necessários
print_section "Instalando pacotes necessários"
apt --fix-broken install -y python-pycurl python-apt aptitude
check_status

apt-get install -y software-properties-common build-essential libssl-dev
check_status

apt-get install -y curl unzip mcrypt git lynx vim
check_status

# Finalização
print_section "Fim da atualização do servidor"
echo -e "#=========================== FIM DO SCRIPT ====================================\n\n"

exit 0
