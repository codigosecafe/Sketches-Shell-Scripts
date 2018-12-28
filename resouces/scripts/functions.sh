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
    sudo apt-get -y dist-upgrade
}

#### FUNCOES DO APACHE
fn_install_apache(){
    clear
    cd ~/
    echo "|----------------------------------------------------|"
    echo "##### => Instalando o Apache"
    echo "|----------------------------------------------------|"
    sudo apt install apache2 -y
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
    sudo apt purge apache* -y
    sudo apt remove apache* -y

    sudo apt autoremove -y
    sudo apt autoclean -y

    echo "##### => REMOVENDO ARQUIVOS DO APACHE"
    sudo rm -R -f -v  /etc/apache2
    sudo rm -R -f -v  /var/lib/apache2
    sudo rm -R -f -v  /etc/init.d/apache2
    sudo rm -R -f -v  /usr/sbin/apache2

}
#### FUNCOES DO PHP
fn_install_php(){
    clear
    cd ~/
    echo "|----------------------------------------------------|"
    echo "##### => Instalando o PHP 7.1"
    echo "|----------------------------------------------------|"
    sudo apt install -y software-properties-common
    sudo add-apt-repository -y ppa:ondrej/php
    sudo apt update -y
    sudo apt-cache pkgnames | grep php7.1
    sudo apt install php7.1 php7.1-common php-pear -y
    sudo apt install php7.1-cli php7.1-gd libapache2-mod-php7.1 php7.1-mysql php7.1-curl php7.1-json php-memcached php7.1-dev php7.1-mcrypt php7.1-sqlite3 php7.1-mbstring php7.1-zip php7.1-xml -y
    sudo apt-cache pkgnames | grep php7.1
    sudo a2dismod php7.2 
    sudo a2enmod php7.1 
    sudo update-alternatives --set php /usr/bin/php7.1  
    php -i | grep /etc/php/7.1/apache2/php.ini
    php --ini
    if [ "$(which apache2)" == "/usr/sbin/apache2" ]
    then
        echo "##### => REINICIANDO APACHE"
        sudo /etc/init.d/apache2 restart
    fi
}

fn_uninstall_php(){
    clear
    cd ~/
    echo "|----------------------------------------------------|"
    echo "##### => REMOVENDO o PHP"
    echo "|----------------------------------------------------|"
   
    sudo apt purge php7.1 php7.1-common php-pear -y
    sudo apt purge php7.1-cli php7.1-gd libapache2-mod-php7.1 php7.1-mysql php7.1-curl php7.1-json php-memcached php7.1-dev php7.1-mcrypt php7.1-sqlite3 php7.1-mbstring php7.1-zip php7.1-xml -y
    sudo apt-get remove --purge php\* -y

    sudo apt autoremove -y
    sudo apt autoclean -y

    echo "##### => REMOVE ARQUIVOS DO PHP"
    sudo rm -R -f -v /etc/php
    sudo rm -R -f -v /usr/lib/php 
    sudo rm -R -f -v /usr/share/php*

    if [ "$(which apache2)" == "/usr/sbin/apache2" ]
    then
        echo "##### => REINICIANDO APACHE"
        sudo /etc/init.d/apache2 restart
    fi
}

#### FUNCOES DO MySQl
fn_install_MySQL(){
    clear
    PASSWORD=$1
    echo "|----------------------------------------------------|"
    echo "##### => instalando MySQL 5.7"
    echo "|----------------------------------------------------|"

    cd ~/

    # sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $PASSWORD"
    # sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $PASSWORD"
    # sudo debconf-set-selections <<< "mysql-community-server mysql-community-server/root-pass password $PASSWORD"
    # sudo debconf-set-selections <<< "mysql-community-server mysql-community-server/re-root-pass password $PASSWORD"
    
    
    env -i wget https://dev.mysql.com/get/mysql-apt-config_0.8.11-1_all.deb
    env -i sudo dpkg -i mysql-apt-config_0.8.11-1_all.deb
    sudo apt-get update
    sudo apt-get install -y mysql-server
   # sudo apt-get install -y mysql-community-server
    env -i mysql_upgrade -u root -p"$PASSWORD" --force
    #env -i mysql_upgrade -u root -p --force
    sudo service mysql stop
    sudo usermod -d /var/lib/mysql/ mysql
    sudo service mysql start
    sudo sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf
    mysql -uroot -p"$PASSWORD" -e "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$PASSWORD' WITH GRANT OPTION; FLUSH PRIVILEGES;"
    sudo /etc/init.d/mysql restart

    # cd ~/
    # # env -i wget https://dev.mysql.com/get/mysql-apt-config_0.8.11-1_all.deb
    # # env -i sudo dpkg -i mysql-apt-config_0.8.11-1_all.deb
    # sudo apt update
    # sudo apt install -y mysql-server mysql-client
    # env -i mysql_upgrade -u root -p$DEFAULTPASS --force
    #  sudo /etc/init.d/mysql stop
    #  sudo usermod -d /var/lib/mysql/ mysql
    #  sudo /etc/init.d/mysql start
    #  sudo sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf
    # sudo /etc/init.d/mysql restart
    # mysql -uroot -p[senha] -e "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$PASSWORD' WITH GRANT OPTION; FLUSH PRIVILEGES;"
    # sudo /etc/init.d/mysql restart
     
exit
    #env -i sudo apt-get install mysql-server mysql-client -y
}

fn_uninstall_MySQL(){
    clear
    cd ~/
    echo "|----------------------------------------------------|"
    echo "##### => REMOVENDO o MySQL"
    echo "|----------------------------------------------------|"
    sudo apt-get remove --purge mysql\* -y

    sudo apt autoremove -y
    sudo apt autoclean -y

    

    echo "##### => REMOVE ARQUIVOS DO MySQL"
    sudo rm -R -f -v /usr/bin/mysql 
    sudo rm -R -f -v /usr/lib/mysql 
    sudo rm -R -f -v /etc/mysql 
    sudo rm -R -f -v /usr/share/mysql 
    sudo rm -R -f -v /usr/share/man/man1/mysql.1.gz
    sudo rm -R -f -v /var/run/mysqld

}
