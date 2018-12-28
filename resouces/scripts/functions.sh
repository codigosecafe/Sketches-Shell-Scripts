#!/bin/bash

#### FUNCOES INSTALA PACOTES NESCESSARIOS
fn_install_resources(){
    clear
    cd ~/
    echo "|----------------------------------------------------------------------------------------------|"
    echo "##### => Instala alguns pacotes que serão necessários para realizar nossa configuração."
    echo "|----------------------------------------------------------------------------------------------|"
    sudo apt --fix-broken install python-pycurl python-apt
    sudo apt-get install software-properties-common build-essential libssl-dev --assume-yes --force-yes
    sudo apt-get install curl unzip mcrypt git lynx vim aptitude --assume-yes --force-yes
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
    sudo apt install apache2 --assume-yes --force-yes
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
    sudo apt purge apache* --assume-yes --force-yes
    sudo apt remove apache* --assume-yes --force-yes

    sudo apt autoremove --assume-yes --force-yes
    sudo apt autoclean --assume-yes --force-yes

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
    sudo apt install software-properties-common --assume-yes --force-yes
    sudo add-apt-repository ppa:ondrej/php --assume-yes --force-yes
    sudo apt update --assume-yes --force-yes
    sudo apt-cache pkgnames | grep php7.1
    sudo apt install php7.1 php7.1-common php-pear --assume-yes --force-yes
    sudo apt install php7.1-cli php7.1-gd libapache2-mod-php7.1 php7.1-mysql php7.1-curl php7.1-json php-memcached php7.1-dev php7.1-mcrypt php7.1-sqlite3 php7.1-mbstring php7.1-zip php7.1-xml --assume-yes --force-yes
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
   
    sudo apt purge php7.1 php7.1-common php-pear --assume-yes --force-yes
    sudo apt purge php7.1-cli php7.1-gd libapache2-mod-php7.1 php7.1-mysql php7.1-curl php7.1-json php-memcached php7.1-dev php7.1-mcrypt php7.1-sqlite3 php7.1-mbstring php7.1-zip php7.1-xml --assume-yes --force-yes
    sudo apt purge php* --assume-yes --force-yes
    sudo apt remove php* --assume-yes --force-yes

    sudo apt autoremove --assume-yes --force-yes
    sudo apt autoclean --assume-yes --force-yes

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
    echo "##### => instalando MariaDB"
    echo "|----------------------------------------------------|"
    cd ~/

     if ! grep "http://mirror.ufscar.br/mariadb/repo/10.3/ubuntu bionic main" /etc/apt/sources.list > /dev/null
    then
        sudo apt-get install software-properties-common
        sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
        sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://mirror.ufscar.br/mariadb/repo/10.3/ubuntu bionic main'
        fn_update_upgrade
    fi
    sudo apt update

    sudo debconf-set-selections <<< "mariadb-server mysql-server/root_password password $PASSWORD"
    sudo debconf-set-selections <<< "mariadb-server mysql-server/root_password_again password $PASSWORD"

    sudo apt install mariadb-server -qq --assume-yes
   
    sudo mysql_upgrade -u root -p"$PASSWORD" --force
    sudo /etc/init.d/mysql stop
    sudo usermod -d /var/lib/mysql/ mysql

    cp /etc/mysql/my.cnf ~/my.cnf.backup
    sudo sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/my.cnf
    sudo sed -i 's/max_connections		= 100/max_connections		= 400/' /etc/mysql/my.cnf
    sudo sed -i 's/innodb_buffer_pool_size = 256M/innodb_buffer_pool_size = 2G/' /etc/mysql/my.cnf
    sudo sed -i 's/#innodb_log_file_size   = 50M/innodb_log_file_size = 128M/' /etc/mysql/my.cnf
    
    sudo /etc/init.d/mysql start

    MYSQL=$(which mysql)

    Q1="GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$PASSWORD' WITH GRANT OPTION;"
    Q2="FLUSH PRIVILEGES;"
    SQL="${Q1}${Q2}"

    sudo $MYSQL -uroot -p$PASSWORD -e "$SQL"
    sudo /etc/init.d/mysql restart

    # sudo apt update
    # sudo apt install mariadb-server mariadb-client --assume-yes --force-yes
    # sleep 2
    # sudo mysql -u root -e "use mysql; update user set plugin=' ' where User='root';flush privileges;"
    # sudo /etc/init.d/mysql restart
    # sudo mysql -u root -e "update user set password=PASSWORD('$PASSWORD') where User='root';"
    # sudo /etc/init.d/mysql restart
    # sudo sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/my.cnf

    # sudo mysql -uroot -p"$PASSWORD" -e "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$PASSWORD' WITH GRANT OPTION; FLUSH PRIVILEGES;"
    
    # sudo /etc/init.d/mysql restart
    
    
    
    
    # env -i mysql_upgrade -u root -p --force


    # sudo sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf
    # mysql -uroot -p"$PASSWORD" -e "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$PASSWORD' WITH GRANT OPTION; FLUSH PRIVILEGES;"
    # sudo /etc/init.d/mysql restart

    # cd ~/
    # # env -i wget https://dev.mysql.com/get/mysql-apt-config_0.8.11-1_all.deb
    # # env -i sudo dpkg -i mysql-apt-config_0.8.11-1_all.deb
    # sudo apt update
    # sudo apt install -y mysql-server mysql-client
    # env -i mysql_upgrade -u root -p$DEFAULTPASS --force
    #  sudo /etc/init.d/mysql stop
    #  sudo usermod -d /var/lib/mysql/ mysql
    #  sudo /etc/init.d/mysql start
    #  sudo sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
    # sudo /etc/init.d/mysql restart
    # mysql -uroot -p[senha] -e "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$PASSWORD' WITH GRANT OPTION; FLUSH PRIVILEGES;"
    # sudo /etc/init.d/mysql restart

    if [ "$(which apache2)" == "/usr/sbin/apache2" ]
    then
        echo "##### => REINICIANDO APACHE"
        sudo /etc/init.d/apache2 restart
    fi
     
exit

}

fn_uninstall_MySQL(){
    clear
    cd ~/
    echo "|----------------------------------------------------|"
    echo "##### => REMOVENDO MariaDB"
    echo "|----------------------------------------------------|"
     
     sudo apt -y purge mariadb-server mariadb-client
     sudo apt -y remove mariadb-server mariadb-client
     
     
     sudo apt autoremove -y
     sudo apt autoclean -y

     sudo rm -Rfv $(which mysql)

    if [ "$(which apache2)" == "/usr/sbin/apache2" ]
    then
        echo "##### => REINICIANDO APACHE"
        sudo /etc/init.d/apache2 restart
    fi
     
}
