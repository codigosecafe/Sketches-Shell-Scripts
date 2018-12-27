#!/bin/bash
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

}

