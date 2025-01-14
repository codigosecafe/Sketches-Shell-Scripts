#!/bin/bash

#==============================================================================#
# Title       : INSTALL APACHE
# Description : Script para instalação e configuração do Apache
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
print_section "Iniciando a instalação e configuração do Apache"

# Instalando Apache
print_section "Instalando Apache2"
apt install apache2 -y
check_status

# Editando arquivo de variáveis do Apache
print_section "Configurando variáveis do Apache"
echo "##### => MELHORANDO SEGURANÇA DO APACHE"
echo "Configurando arquivo /etc/apache2/envvars"
sed -i 's/^#export LANG=C.UTF-8/export LANG=en_US.UTF-8/' /etc/apache2/envvars
check_status

# Configurações de segurança do Apache
print_section "Melhorando segurança do Apache"
sed -i 's/^#ServerTokens Prod/ServerTokens Prod/' /etc/apache2/conf-available/security.conf
sed -i 's/^#ServerSignature On/ServerSignature Off/' /etc/apache2/conf-available/security.conf
check_status

# Habilitando módulos
print_section "Habilitando módulos do Apache"
a2enmod rewrite deflate ssl
check_status

# Reiniciando Apache
print_section "Reiniciando Apache"
systemctl restart apache2
check_status

# Adicionando modelo padrão para VirtualHost
print_section "Adicionando modelo padrão para VirtualHost"
cat <<EOL > ~/padraoCECSERVER.conf
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    ServerName dev.padrao
    DocumentRoot /var/www/padrao/public

    <Directory /var/www/padrao/public>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Order allow,deny
        allow from all

        SetOutputFilter DEFLATE
        AddOutputFilterByType DEFLATE text/html
        AddOutputFilterByType DEFLATE text/plain
        AddOutputFilterByType DEFLATE text/xml
        AddOutputFilterByType DEFLATE text/css
        AddOutputFilterByType DEFLATE text/javascript
        AddOutputFilterByType DEFLATE application/javascript
        AddOutputFilterByType DEFLATE application/xhtml+xml
        AddOutputFilterByType DEFLATE application/xml
        AddOutputFilterByType DEFLATE application/rss+xml
        AddOutputFilterByType DEFLATE application/atom_xml
        AddOutputFilterByType DEFLATE application/x-javascript
        AddOutputFilterByType DEFLATE application/x-httpd-php
        AddOutputFilterByType DEFLATE application/x-httpd-fastphp
        AddOutputFilterByType DEFLATE application/x-httpd-eruby
        AddOutputFilterByType DEFLATE image/svg+xml 
        AddOutputFilterByType DEFLATE text/plain
        AddOutputFilterByType DEFLATE application/json
        AddOutputFilterByType DEFLATE font/otf
        AddOutputFilterByType DEFLATE font/ttf
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/padrao_error.log
    CustomLog \${APACHE_LOG_DIR}/padrao_access.log combined
</VirtualHost>
EOL

# Movendo o arquivo de configuração para o diretório do Apache
mv ~/padraoCECSERVER.conf /etc/apache2/sites-available/
check_status

# Finalizando
print_section "Fim da instalação e configuração do Apache"
echo -e "#=========================== FIM DO SCRIPT ====================================\n\n"

exit 0
