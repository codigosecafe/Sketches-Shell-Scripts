#!/bin/bash
view_home(){
    MSG="BEM VINDO AO SCRIPT DE CONFIGURAÇÃO PARA SERVIDORES UBUNTU, ESSE SCRIPT FOI TESTADO NO S.O. UBUNTU 18"
    if (whiptail --title "$TITLE_APP" --yes-button "INICIAR SETUP" --no-button "SAIR"  --yesno "$MSG" 8 78); then
        view_menu_recommendations
    else
        view_close
    fi
}
