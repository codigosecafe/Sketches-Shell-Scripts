#!/bin/bash
view_cancel(){
    clear
    MSG="DESEJA SAIR DO SETUP DE CONFIGURAÇÂO?"
    if (whiptail --title "$TITLE_APP" --backtitle "Claudio Alexssandro Lino <https://github.com/codigosecafe/meus-shell-scripts/>" --yes-button "NÃO" --no-button "SIM"  --yesno "$MSG" 8 78); then
        TYPE_MENU=$1
        if [ $TYPE_MENU = "1" ];
        then
            view_menu_recommendations

        elif [ $TYPE_MENU = "2" ];
        then
            view_menu_uninstall

        elif [ $TYPE_MENU = "3" ];
        then
            view_home
        else
            view_menu
        fi
        
    else
        view_close
    fi
}
