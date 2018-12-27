#!/bin/bash
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
    echo "##### => Lendo e atualizando os pacotes do sistema"
    echo "|----------------------------------------------------|"
    fn_update_upgrade
    sudo apt-get -y dist-upgrade
}

