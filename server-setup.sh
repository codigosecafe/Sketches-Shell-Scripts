#!/bin/bash

line()
{
    msg=$1
    echo "|> --- $msg"
}
check_folders()
{
  folder=$1
  if [ ! -d "$folder" ]; then
   line "criando pasta $folder"
   mkdir -p "$folder"
   # check_folders $folder
  fi  
}
check_file_init()
{
    file=$1
    name=$2
    url=$3
    if [ ! -f "$file" ]
    then
        line "baixando o arquivo"
        wget "$url"
        line "movendo o arquivo"
        mv "$name" "$file"
    fi
}

init_script(){
    progressbar=0
    {
        
        # Checo se os diretorios existem 
        progressbar=$progressbar+5
        echo -e "XXX\n5\nCHECANDO DIRETÓRIOS -> ./config.\nXXX"
            check_folders ./config
        sleep 0.1

        
        echo -e "XXX\n10\nCHECANDO DIRETÓRIOS -> resouces/scripts.\nXXX"
            check_folders resouces/scripts
        sleep 0.1

        echo -e "XXX\n15\nCHECANDO DIRETÓRIOS -> resouces/views.\nXXX"      
            check_folders resouces/views
        sleep 0.1

        # Checo se as views existem
        echo -e "XXX\n20\nCHECANDO VIEWS -> about.sh.\nXXX"
            check_file_init ./resouces/views/about.sh about.sh https://raw.githubusercontent.com/codigosecafe/meus-shell-scripts/dev_shell/resouces/views/about.sh
        sleep 0.1

        echo -e "XXX\n25\nCHECANDO VIEWS -> cancel-view.sh.\nXXX"
            check_file_init ./resouces/views/cancel-view.sh cancel-view.sh https://raw.githubusercontent.com/codigosecafe/meus-shell-scripts/dev_shell/resouces/views/cancel-view.sh
        sleep 0.1

        echo -e "XXX\n30\nCHECANDO VIEWS -> exit-view.sh.\nXXX"
            check_file_init ./resouces/views/exit-view.sh exit-view.sh https://raw.githubusercontent.com/codigosecafe/meus-shell-scripts/dev_shell/resouces/views/exit-view.sh
        sleep 0.1

        echo -e "XXX\n35\nCHECANDO VIEWS -> home-view.sh.\nXXX"
            check_file_init ./resouces/views/home-view.sh home-view.sh https://raw.githubusercontent.com/codigosecafe/meus-shell-scripts/dev_shell/resouces/views/home-view.sh
        sleep 0.1

        echo -e "XXX\n40\nCHECANDO VIEWS -> menu-recommendations-view.sh.\nXXX"
            check_file_init ./resouces/views/menu-recommendations-view.sh menu-recommendations-view.sh https://raw.githubusercontent.com/codigosecafe/meus-shell-scripts/dev_shell/resouces/views/menu-recommendations-view.sh
        sleep 0.1

        echo -e "XXX\n45\nCHECANDO VIEWS -> menu-view.sh.\nXXX"
            check_file_init ./resouces/views/menu-view.sh menu-view.sh https://raw.githubusercontent.com/codigosecafe/meus-shell-scripts/dev_shell/resouces/views/menu-view.sh
        sleep 0.1

        # Checo se os scripts
        
        echo -e "XXX\n50\nCHECANDO SCRIPTS -> functions.sh.\nXXX"
            check_file_init ./resouces/scripts/functions.sh functions.sh https://raw.githubusercontent.com/codigosecafe/meus-shell-scripts/dev_shell/resouces/scripts/functions.sh
        sleep 0.1
        
        echo -e "XXX\n55\nCHECANDO SCRIPTS -> install_resources.sh.\nXXX"
            check_file_init ./resouces/scripts/install_resources.sh install_resources.sh https://raw.githubusercontent.com/codigosecafe/meus-shell-scripts/dev_shell/resouces/scripts/install_resources.sh
        sleep 0.1
        
        echo -e "XXX\n60\nCHECANDO SCRIPTS -> load_files.sh.\nXXX"
            check_file_init ./resouces/scripts/load_files.sh load_files.sh https://raw.githubusercontent.com/codigosecafe/meus-shell-scripts/dev_shell/resouces/scripts/load_files.sh
        sleep 0.1
        
        echo -e "XXX\n65\nCHECANDO SCRIPTS -> update-upgrade.sh.\nXXX"
            check_file_init ./resouces/scripts/update-upgrade.sh update-upgrade.sh https://raw.githubusercontent.com/codigosecafe/meus-shell-scripts/dev_shell/resouces/scripts/update-upgrade.sh
        sleep 0.1
       
         
         # Checo se os arquivos de configuração existem existem
         echo -e "XXX\n95\nCHECANDO VIEWS -> fail2ban/jail.local.\nXXX"
            check_file_init ./config/fail2ban/jail.local jail.local https://raw.githubusercontent.com/codigosecafe/meus-shell-scripts/dev_shell/config/fail2ban/jail.local
         sleep 0.1
        
        echo -e "XXX\n100\nINICIANDO SCRIPTS.\nXXX"
        sleep 0.1
    } | whiptail --title "SEVER SETUP - CEC" --gauge "Aguarde enquanto preparamos tudo." 6 50 0

    exit
   # clear
   bash ./cec-init.sh 
}

init_script



