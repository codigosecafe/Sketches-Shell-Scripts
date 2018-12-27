#!/bin/bash

view_home(){
    clear
    OPTION=$(whiptail --title "$TITLE_APP" --menu "BEM VINDO AO SCRIPT DE CONFIGURAÇÃO PARA SERVIDORES UBUNTU, ESSE SCRIPT FOI TESTADO NO S.O. UBUNTU 18. OQUE VOCÊ DESEJA FAZER?" 15 60 4 \
        "1" "CONFIGURAR OU INSTALAR RECURSOS" \
        "2" "REMOVER RECURSOS INSTALADOS ANTERIOMENTE" \
        "3" "SAIR"  3>&1 1>&2 2>&3)

    exitstatus=$?
    if [ $exitstatus = 0 ]; then
        case $OPTION in
            1) view_menu_recommendations ;;
            2) view_menu_uninstall ;;
            3) view_close
        esac

    else
        view_cancel 3
    fi
}
