#!/bin/bash
 
# Limpa todas as regras existentes
iptables -F
iptables -X
 
# Aceita todas  as conexões (será filtrado depois)
iptables -P INPUT   ACCEPT
iptables -P OUTPUT  ACCEPT
iptables -P FORWARD ACCEPT
 
# Bloqueia alguns tipos de ataque flood mais simples
iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP
iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP
 
# permite tráfego TCP nas portas 80 e 443 (acrescente outras portas se utilizar)
iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
 
# desativa a resposta do comando ping
iptables -A OUTPUT -p icmp -o eth0 -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-reply -s 0/0 -i eth0 -j ACCEPT
iptables -A INPUT -p icmp --icmp-type destination-unreachable -s 0/0 -i eth0 -j ACCEPT
iptables -A INPUT -p icmp --icmp-type time-exceeded -s 0/0 -i eth0 -j ACCEPT
iptables -I INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p icmp -i eth0 -j DROP
 
# permite o SSH, FTP e portas passivas 
# as portas passivas foram configuradas em nosso tutorial do servidor ftp
# modifique para corresponder as suas portas caso seja necessário
# lembre-se de acrescentar as portas adicionais que utilizar
iptables -A INPUT -p tcp --dport ssh --jump ACCEPT
iptables -A INPUT -p tcp --dport 20 --jump ACCEPT
iptables -A INPUT -p tcp --dport 21 --jump ACCEPT
iptables -A INPUT -p tcp --dport 60000:60005 --jump ACCEPT
iptables -A INPUT -s 127.0.0.1/32 --jump ACCEPT
 
# nega qualquer conexão que não esteja na regra
# TENHA CERTEZA QUE NÃO SE ESQUECEU DE NADA! 
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -L -n