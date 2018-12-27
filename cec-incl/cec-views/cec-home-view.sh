#!/bin/bash

init_home(){
    if (whiptail --title "$TITLE_APP" --yes-button "SIM" --no-button "NÃO"  --yesno "Deseja realmente configurar essa maquina como servidor web?." 8 78); then
        init_menu
    else
        close_app
    fi
}

