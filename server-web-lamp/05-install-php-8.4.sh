#!/bin/bash

#==============================================================================#
# Title       : INSTALL PHP 8.4
# Description : Script para instalação do PHP 8.4
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
print_section "Iniciando a instalação do PHP 8.4"

# Atualizando pacotes
print_section "Atualizando pacotes do sistema"
apt-get update -y
check_status

# Instalando dependências
print_section "Instalando dependências necessárias"
apt-get install -y software-properties-common aptitude curl unzip
check_status

# Adicionando o repositório de PHP
print_section "Adicionando repositório PPA de PHP"
add-apt-repository -y ppa:ondrej/php
apt-get update -y
check_status

# Instalando o PHP 8.4 e os pacotes necessários
print_section "Instalando PHP 8.4 e pacotes adicionais"
apt-get install -y php8.4 php8.4-common php8.4-cli php8.4-fpm php8.4-bz2 php8.4-cgi php8.4-bcmath php8.4-fpm php8.4-mysql php8.4-opcache php8.4-xml php8.4-intl php8.4-curl php8.4-ldap php8.4-imap php8.4-gmp php8.4-mbstring php8.4-json php8.4-zip php8.4-soap php8.4-pgsql libapache2-mod-php8.4
check_status

# Habilitando o módulo PHP 8.4 no Apache
print_section "Habilitando o módulo PHP 8.4 no Apache"
a2enmod php8.4
check_status

# Definindo PHP 8.4 como versão padrão
print_section "Definindo o PHP 8.4 como versão padrão"
update-alternatives --set php /usr/bin/php8.4
check_status

# Verificando a instalação do PHP
print_section "Verificando a instalação do PHP"
php -v
php -i | grep /etc/php/8.4/apache2/php.ini
check_status

# Reiniciando Apache
print_section "Reiniciando Apache para aplicar as configurações"
systemctl restart apache2
check_status

# Instalando o Composer
print_section "Instalando o Composer"
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
check_status

# Limpeza de pacotes
print_section "Atualizando, limpando pacotes e otimizando o sistema"
apt-get -y upgrade
apt-get -y clean
apt-get -y autoclean
check_status

# Criando página de info do PHP
print_section "Criando página de info do PHP"
echo '<?php phpinfo(); ?>' > /var/www/html/showinfo.php
check_status

# Fim do script
print_section "Instalação do PHP 8.4 concluída"
echo -e "#=========================== FIM DO SCRIPT ====================================\n\n"

exit 0
