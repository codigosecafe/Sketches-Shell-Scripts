#!/bin/bash
view_menu_uninstall(){
    clear
    RESOUCES=$(whiptail --title "$TITLE_APP" --backtitle "Claudio Alexssandro Lino <https://github.com/codigosecafe/meus-shell-scripts/>" --checklist \
                "\nSELECIONE OS RECURSOS QUE DESEJA REMOVER" 15 72 6 \
                "Apache2" "Remove o apache do sistema " OFF \
                "PHP" "Remove o PHP do sistema. " OFF \
                "MySQL" "Remove MySQL do sistema. " OFF \
                "Fail2ban" "Remove Fail2ban do sistema. " OFF \
                "Recursos" "Remove alguns pacotes adicionados anteriormente. " OFF 3>&1 1>&2 2>&3
            )
    status=$?
    if [ $status = 0 ]
    then

        if  echo "$RESOUCES" | grep -q "Apache2"; then 
            fn_uninstall_apache
            
        fi

        if  echo "$RESOUCES" | grep -q "PHP"; then 
            fn_uninstall_php
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
        
        view_cancel 3
    else
        view_cancel 2
    fi

}

