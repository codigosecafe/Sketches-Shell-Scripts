#!/bin/bash
echo "\n\n"
echo "#=============================================================================="
echo "# title       : PROTEGER SERVIDORS"
echo "# description : CONFIGURANDO O SERVER PARA PREVINIR DE ATAQUES."
echo "# author      : Claudio Alexssandro Lino"
echo "# site        : http://cecdigitalmaker.com.br"
echo "# github      : https://github.com/codigosecafe"
echo "# date        : 21/12/2018"
echo "# version     : 1.0"
echo "#=============================================================================="
cd ~/
echo "\n"
echo "|----------------------------------------------------|"
echo "##### => Proteger contra ataques Synflood ou DDoS"
echo "|----------------------------------------------------|"
echo "# => Prevenir estes excessos de pedidos SYN"
echo 1 > /proc/sys/net/ipv4/tcp_syncookies
echo "# => Bloquear ICMP PING REQUEST"
iptables -A OUTPUT -p icmp –icmp-type echo-request -j DROP
echo "# => Operação OK"
echo "\n"
echo "|----------------------------------------------------|"
echo "##### => Instalar fail2ban"
echo "|----------------------------------------------------|"
echo "# => Lendo e atualizando os pacotes do sistema"
sudo apt-get update
sudo apt-get upgrade
echo "\n"
echo "# => Instalando o fail2ban"
sudo apt-get install -y fail2ban
echo "\n"
echo "# => Baixando o arquivo de configuração do fail2ban"
env -i wget https://raw.githubusercontent.com/codigosecafe/meus-shell-scripts/desenvolvimento/jail.local
echo "# => Movendo o arquivo de configuração do fail2ban"
env -i cp jail.local /etc/fail2ban/jail.local
env -i rm jail.local
echo "\n"
echo "# => Habilitando o service do fail2ban"
sudo systemctl start fail2ban.service
systemctl enable fail2ban.service
echo "# => Operação OK"
echo "\n"
echo "|----------------------------------------------------|"
echo "##### => Limpando o arquivo auth.log"
echo "|----------------------------------------------------|"
echo -n>/var/log/auth.log
echo "# => Operação OK"
echo "\n"
echo "|----------------------------------------------------|"
echo "##### => Alterar a porta SSH"
echo "|----------------------------------------------------|"
echo -n "# => Deseja alterar a porta ssh? (s)sim/(n)nao "
read respostassh
case "$respostassh" in
    s|S|"")
        vim /etc/ssh/sshd_config
        echo -n "# => Qual foi a porta definida "
        read respostaportassh
        service sshd restart
        echo "# => Operação OK"
    ;;
    *)
        echo "# => Operação interrupida"
        respostaportassh=22
    ;;
esac

echo "\n"
echo "|----------------------------------------------------|"
echo "##### => UFW - FIREWALL"
echo "|----------------------------------------------------|"
echo -n "# => Configurar UFW? (s)sim/(n)nao "
read resposta
case "$resposta" in
    s|S|"")
        echo "# => Habilitando UFW"
        sudo ufw enable
        echo "# => Bloqueia tudo na entrada padrão"
        sudo ufw default deny incoming
        echo "# =>  Permite ssh"
        sudo ufw allow ssh
        echo "# =>  Permite porta $respostaportassh"
        sudo ufw allow $respostaportassh
        echo "# =>  Permite http"
        sudo ufw allow http
        echo "# =>  Permite https"
        sudo ufw allow https
        echo "# =>  Permite porta 80"
        sudo ufw allow 80
        echo "# =>  Permite porta 3306"
        sudo ufw allow 3306
        echo "# =>  Reinicia UFW"
        sudo ufw reload
        echo "# => Operação OK"
    ;;
    *)
        echo "# => Operação interrupida"
    ;;
esac

exit 
