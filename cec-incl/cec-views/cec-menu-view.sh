#!/bin/bash
init_menu(){

    RESOUCES=$(whiptail --title "$TITLE_APP" --checklist \
                "SELECIONE OS RECURSOS QUE DESEJA EXECUTAR!" 20 80 7 \
                "Atualização" "Lê e atualiza os pacotes disponiveis" ON \
                "Recursos" "Instala os recursos nescessários" ON \
                "Apache2" "Instala o apache" ON \
                "PHP" "Instala o PHP 7.1*" ON \
                "MySQL" "Instala o servidor MySQL" ON \
                "Fish" "Instala o shell fish no sistema" ON 3>&1 1>&2 2>&3
            )

status=$?
if [ $status = 0 ]
then
    if  echo "$RESOUCES" | grep -q "Atualização"; then 
        cd ~/
        echo "|----------------------------------------------------|"
        echo "##### => Lendo e atualizando os pacotes do sistema"
        echo "|----------------------------------------------------|"
        sudo dpkg --configure -a
        sudo apt-get update 
        sudo apt-get -y upgrade 
    fi
    init_home
else
   init_home
fi

    
}

