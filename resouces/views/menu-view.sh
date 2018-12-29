#!/bin/bash
view_menu(){
    clear
    RESOUCES=$(whiptail --title "$TITLE_APP" --backtitle "$TITLE_APP_BACK" --checklist \
                "\nSELECIONE OS RECURSOS QUE DESEJA EXECUTAR!" 20 80 9 \
                "Apache2" "Instala o apache" OFF \
                "PHP" "Instala o PHP 7.1.*" OFF \
                "MariaDB" "Instala o servidor do banco de dados MariaDB (MySQL)" OFF \
                "Composer" "Instala o composer" OFF \
                "Firewall" "Configura o firewall (Recomendado) " OFF \
                "SSH" "Configura o SSH (Recomendado) " OFF \
                "Fail2ban" "Configura o Fail2ban (Recomendado) " OFF \
                "Fish" "Instala o shell fish no sistema" OFF 3>&1 1>&2 2>&3
            )
    status=$?
    if [ $status = 0 ]
    then

        if  echo "$RESOUCES" | grep -q "MariaDB"; then 
            PASSWORD=$(whiptail --passwordbox "\nDEFINA A SENHA DO USUARIO ROOT DO MariaDB (MySQL)" 8 78 --title "$TITLE_APP" --backtitle "$TITLE_APP_BACK" 3>&1 1>&2 2>&3)
            exitstatus=$?
            if [ $exitstatus = 0 ]; then
                fn_install_MariaDB $PASSWORD
            fi
        fi

        if  echo "$RESOUCES" | grep -q "Apache2"; then 
            fn_install_apache
        fi

        if  echo "$RESOUCES" | grep -q "PHP"; then 
            fn_install_php
        fi
        
        if  echo "$RESOUCES" | grep -q "Composer"; then 
            echo "fn_install_composer"
        fi
        
        if  echo "$RESOUCES" | grep -q "Firewall"; then 
            echo "fn_install_firewall"
        fi
        
        if  echo "$RESOUCES" | grep -q "SSH"; then 
            echo "fn_install_ssh"
        fi
        
        if  echo "$RESOUCES" | grep -q "Fail2ban"; then 
            echo "fn_install_fail2ban"
        fi
        
        if  echo "$RESOUCES" | grep -q "Fish"; then 
            echo "fn_install_fish"
        fi

        view_cancel
        #view_home
    else
         view_cancel
    fi

}

