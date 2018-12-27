#!/bin/bash
view_menu_uninstall(){
    clear
    RESOUCES=$(whiptail --title "$TITLE_APP" --checklist \
                "SELECIONE OS RECURSOS QUE DESEJA REMOVER" 12 105 6 \
                "Apache" "Remove o apache do sistema" OFF \
                "PHP" "Remove o PHP do sistema." OFF \
                "MySQL" "Remove MySQL do sistema." OFF \
                "Fail2ban" "Remove Fail2ban do sistema." OFF \
                "Recursos" "Remove alguns pacotes adicionados anteriormente." OFF 3>&1 1>&2 2>&3
            )
    status=$?
    if [ $status = 0 ]
    then

        if  echo "$RESOUCES" | grep -q "Apache"; then 
            echo "Apache"
            
        fi

        if  echo "$RESOUCES" | grep -q "PHP"; then 
            echo "PHP"
        fi

        if  echo "$RESOUCES" | grep -q "MySQL"; then 
            echo "MySQL"
        fi

        if  echo "$RESOUCES" | grep -q "Fail2ban"; then 
            echo "Fail2ban"
        fi

        if  echo "$RESOUCES" | grep -q "Recursos"; then 
            echo "Recursos"
        fi
        
        view_menu
    else
        view_cancel 2
    fi

}

