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
        echo -e "XXX\n5\nCHECANDO DIRETÓRIOS -> resouces/config.\nXXX"
            check_folders resouces/config
        sleep 0.2

        
        echo -e "XXX\n10\nCHECANDO DIRETÓRIOS -> resouces/scripts.\nXXX"
            check_folders resouces/scripts
        sleep 0.2

        echo -e "XXX\n15\nCHECANDO DIRETÓRIOS -> resouces/views.\nXXX"      
            check_folders resouces/views
        sleep 0.2

        # Checo se os scripts existem
        echo -e "XXX\n20\nCHECANDO SCRIPTS -> cec-home-view.sh.\nXXX"
            check_file_init ./resouces/views/cec-home-view.sh cec-home-view.sh https://raw.githubusercontent.com/codigosecafe/meus-shell-scripts/dev_shell/resouces/views/cec-home-view.sh
        sleep 0.2

        echo -e "XXX\n25\nCHECANDO SCRIPTS -> cec-exit-view.sh.\nXXX"
            check_file_init ./resouces/views/cec-exit-view.sh cec-exit-view.sh https://raw.githubusercontent.com/codigosecafe/meus-shell-scripts/dev_shell/resouces/views/cec-exit-view.sh
        sleep 0.2

        echo -e "XXX\n30\nCHECANDO SCRIPTS -> cec-installer.sh.\nXXX"
            check_file_init ./cec-installer.sh cec-installer.sh https://raw.githubusercontent.com/codigosecafe/meus-shell-scripts/dev_shell/cec-installer.sh
        sleep 0.2

        echo -e "XXX\n35\nCHECANDO SCRIPTS -> cec-menu-view.sh.\nXXX"
            check_file_init ./resouces/views/cec-menu-view.sh cec-menu-view.sh https://raw.githubusercontent.com/codigosecafe/meus-shell-scripts/dev_shell/resouces/views/cec-menu-view.sh
        sleep 0.2

         # Checo se os arquivos de configuração existem existem
         echo -e "XXX\n95\nCHECANDO SCRIPTS -> fail2ban/jail.local.\nXXX"
            check_file_init ./resouces/config/fail2ban/jail.local jail.local https://raw.githubusercontent.com/codigosecafe/meus-shell-scripts/dev_shell/resouces/config/fail2ban/jail.local
         sleep 0.2
        
        echo -e "XXX\n100\nINICIANDO SCRIPTS.\nXXX"
        sleep 0.2
    } | whiptail --title "SEVER SETUP - CEC" --gauge "Aguarde enquanto preparamos tudo." 6 50 0

    #exit
   # clear
   bash ./cec-installer.sh 
}

init_script



