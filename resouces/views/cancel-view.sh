#!/bin/bash
view_cancel(){
   clear
   MSG="DESEJA SAIR DO SETUP DE CONFIGURAÇÂO?"
    if (whiptail --title "$TITLE_APP" --yes-button "NÃO" --no-button "SIM"  --yesno "$MSG" 8 78); then
        TYPE_MENU=$1
        if [ $TYPE_MENU = "1" ];
        then
            view_menu_recommendations
        else
            view_menu
        fi
        
    else
        view_close
    fi
}
