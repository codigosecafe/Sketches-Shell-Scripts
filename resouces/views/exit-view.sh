#!/bin/bash
view_close(){
   clear
   msg="Obrigado por usar o script, quero que ele se torne algo util para muitos desenvolvedoress."
   whiptail --title "$TITLE_APP" --msgbox "$msg" 10 60
   source ./resouces/views/about.sh 
   exit
}
