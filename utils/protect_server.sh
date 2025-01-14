#!/bin/bash

#==============================================================================#
# Title       : Protegendo Servidor
# Description : Configurando o servidor para prevenir ataques.
# Author      : Claudio Alexssandro Lino
# Site        : http://cecdigitalmaker.com.br
# GitHub      : https://github.com/codigosecafe
# Date        : 21/12/2018
# Version     : 1.0.1
#==============================================================================#

# Função para exibir uma mensagem com bordas decorativas
print_section() {
    echo -e "\n|----------------------------------------------------|"
    echo -e "$1"
    echo -e "|----------------------------------------------------|\n"
}

# Função para verificar o status de comandos
check_status() {
    if [ $? -eq 0 ]; then
        echo "✅ Operação concluída com sucesso."
    else
        echo "❌ Erro ao executar o comando."
        exit 1
    fi
}

# Garantindo que o script esteja sendo executado como root
if [ "$EUID" -ne 0 ]; then
    echo "Por favor, execute como root."
    exit 1
fi

# Proteção contra ataques Synflood e DDoS
print_section "Proteção contra ataques Synflood ou DDoS"
echo "1" > /proc/sys/net/ipv4/tcp_syncookies
check_status

# Bloquear ICMP Ping Request
echo "Bloqueando ICMP Ping Request..."
iptables -A OUTPUT -p icmp --icmp-type echo-request -j DROP
check_status

# Instalação do Fail2Ban
print_section "Instalando Fail2Ban"
echo "Atualizando pacotes do sistema..."
apt-get update && apt-get upgrade -y
check_status

echo "Instalando Fail2Ban..."
apt-get install -y fail2ban
check_status

# Configurando Fail2Ban
echo "Copiando arquivo de configuração do Fail2Ban..."
if [ -f ~/script-up-server/utils/jail.local ]; then
    cp ~/script-up-server/utils/jail.local /etc/fail2ban/jail.local
    #rm ~/script-up-server/utils/jail.local
    check_status
else
    echo "⚠️ Arquivo ~/script-up-server/jail.local não encontrado. Pulando etapa."
fi

echo "Iniciando serviço do Fail2Ban..."
systemctl start fail2ban.service
systemctl enable fail2ban.service
check_status

# Limpeza do arquivo auth.log
print_section "Limpando o arquivo auth.log"
echo -n > /var/log/auth.log
check_status

# Alteração da porta SSH
print_section "Alteração da Porta SSH"
read -p "Deseja alterar a porta SSH? (s)sim/(n)não: " respostassh
if [ "$respostassh" = "s" ] || [ "$respostassh" = "S" ]; then
    vim /etc/ssh/sshd_config
    read -p "Qual foi a porta definida? " respostaportassh
    systemctl restart sshd
    check_status
else
    echo "Alteração de porta SSH pulada."
    respostaportassh=22
fi

# Configuração do UFW (Firewall)
print_section "Configuração do UFW (Firewall)"
read -p "Deseja configurar o UFW? (s)sim/(n)não: " resposta
if [ "$resposta" = "s" ] || [ "$resposta" = "S" ]; then
    echo "Habilitando UFW..."
    ufw enable
    check_status

    echo "Definindo políticas padrão..."
    ufw default deny incoming
    ufw allow ssh
    ufw allow $respostaportassh
    ufw allow http
    ufw allow https
    ufw allow 3306
    ufw allow 6379
    ufw reload
    check_status
else
    echo "Configuração do UFW pulada."
fi

# Reinicialização do servidor
print_section "Reiniciando o servidor"
read -p "Deseja reiniciar o servidor agora? (s)sim/(n)não: " reiniciar
if [ "$reiniciar" = "s" ] || [ "$reiniciar" = "S" ]; then
    reboot
else
    echo "Reinicialização adiada."
fi

# Fim do script
echo -e "\n#=========================== FIM DO SCRIPT ====================================" 
exit 0
