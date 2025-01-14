#!/bin/bash

#==============================================================================#
# Title       : INSTALL PHP 8.3
# Description : Script para instalação do PHP 8.3
# Author      : Claudio Alexssandro Lino
# GitHub      : https://github.com/codigosecafe
# Version     : 1.1.0
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
print_section "Iniciando a instalação do PHP 8.3"

# Atualizando repositórios
print_section "Atualizando pacotes e repositórios"
apt-get update && apt-get -y upgrade
check_status

# Instalando dependências para adicionar repositórios
print_section "Instalando dependências"
apt-get install -y software-properties-common aptitude curl
check_status

# Adicionando repositório PPA para PHP
print_section "Adicionando repositório PPA para PHP"
add-apt-repository -y ppa:ondrej/php
apt-get update -y
check_status

# Instalando PHP 8.3 e pacotes necessários
print_section "Instalando PHP 8.3 e pacotes necessários"
apt-get install -y php8.3 php8.3-common php8.3-cli php8.3-fpm php8.3-mysql php8.3-curl php8.3-xml php8.3-mbstring php8.3-zip php8.3-opcache php8.3-gd php8.3-bz2 php8.3-intl php8.3-soap php8.3-xmlrpc php8.3-ldap php8.3-imap php8.3-mbstring php8.3-pgsql php8.3-recode libapache2-mod-php8.3
check_status

# Habilitando o módulo PHP 8.3 no Apache
print_section "Habilitando módulo PHP 8.3 no Apache"
a2enmod php8.3
check_status

# Definindo o PHP 8.3 como a versão padrão
print_section "Configurando PHP 8.3 como versão padrão"
update-alternatives --set php /usr/bin/php8.3
check_status

# Verificando a instalação do PHP
print_section "Verificando a instalação do PHP"
php -v
check_status

# Reiniciando Apache para aplicar as mudanças
print_section "Reiniciando o Apache"
systemctl restart apache2
check_status

# Instalando o Composer
print_section "Instalando o Composer"
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
check_status

# Limpeza de pacotes e cache
print_section "Limpando pacotes e cache"
apt-get -y clean && apt-get -y autoclean
check_status

# Criando arquivo PHP para teste
print_section "Criando arquivo PHP para testar a instalação"
echo '<?php phpinfo(); ?>' > /var/www/html/showinfo.php
check_status

# Finalizando
print_section "Fim da instalação do PHP 8.3"
echo "#=========================== FIM DO SCRIPT ====================================\n\n"
exit 0
