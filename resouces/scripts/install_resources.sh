#!/bin/bash
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

