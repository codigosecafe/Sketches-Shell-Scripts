#!/bin/bash

#### FUNCOES INSTALA PACOTES NESCESSARIOS
fn_install_resources(){
    clear
    cd ~/
    echo "|----------------------------------------------------------------------------------------------|"
    echo "##### => Instala alguns pacotes que serão necessários para realizar nossa configuração."
    echo "|----------------------------------------------------------------------------------------------|"
    sudo apt --fix-broken install python-pycurl python-apt
    sudo apt-get install -y software-properties-common build-essential libssl-dev
    sudo apt-get install -y curl unzip mcrypt git lynx vim aptitude
}

#### FUNCOES ATUALIZACAO DOS PACOTES E DISTRIBUICAO
fn_update_upgrade(){
    clear
    cd ~/
    echo "|----------------------------------------------------|"
    echo "##### => Lendo e atualizando os pacotes do sistema"
    echo "|----------------------------------------------------|"
    sudo dpkg --configure -a
    sudo apt-get update 
    sudo apt-get -y upgrade 
}
fn_upgrade_dist(){
    clear
    cd ~/
    echo "|----------------------------------------------------|"
    echo "##### => Atualiza a distribuição do sistema"
    echo "|----------------------------------------------------|"
    fn_update_upgrade
    sudo apt-get -y dist-upgrade
}

#### FUNCOES DO APACHE
fn_install_apache(){
    clear
    cd ~/
    echo "|----------------------------------------------------|"
    echo "##### => Instalando o Apache"
    echo "|----------------------------------------------------|"
    sudo aptitude install apache2 -y
    # sudo vim /etc/apache2/envvars
    echo "##### => MELHORANDO SEGURANÇA DO APACHE"
    sudo sed -i 's/ServerTokens OS/ServerTokens Prod/' /etc/apache2/conf-available/security.conf
    sudo sed -i 's/ServerSignature On/ServerSignature Off/' /etc/apache2/conf-available/security.conf
    
    # sudo vim /etc/apache2/conf-available/security.conf
    env -i sudo a2enmod rewrite 
    env -i sudo a2enmod deflate
    env -i sudo /etc/init.d/apache2 restart
}

fn_uninstall_apache(){
    clear
    cd ~/
    echo "|----------------------------------------------------|"
    echo "##### => Remover o Apache"
    echo "|----------------------------------------------------|"
    sudo aptitude purge apache2 -y
    sudo apt purge apache2 -y
    sudo apt autoclean -y
    sudo rm -R -f /etc/apache2
    sudo rm -R -f /var/lib/apache2

}


