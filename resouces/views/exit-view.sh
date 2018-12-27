#!/bin/bash
view_close(){
   clear
   {
      for ((i = 0 ; i <= 100 ; i+=5)); do
        sleep 0.1
        echo $i
      done
   } | whiptail --gauge "Obrigado por usar o script, quero que ele se torne algo util para muitos desenvolvedoress." 7 80 0
   source ./resouces/views/about.sh 
   exit
}
