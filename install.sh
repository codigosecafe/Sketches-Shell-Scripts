#!/bin/bash
line()
{
    msg=$1
    echo "|> --- $msg"
}
check_folders()
{
  folder=$1
  if [ ! -d "$folder" ]; then
   line "criando pasta $folder"
   mkdir $folder
   # check_folders $folder
  fi  
}
check_file_init()
{
    file=$1
    name=$2
    url=$3
    if [ ! -f "$file" ]
    then
        line "baixando o arquivo"
        wget -O - $url $name
        mv $name $file
    fi
}

init_script(){
    # Checo se os diretorios existem
    line "Checando os diretórios do script"
    check_folders ./incl/config_files
    check_folders ./incl/scripts
    check_folders ./incl/views
    line "OK"
    # Checo se os scripts existem
    line "Checando os arquivos do script"
    check_file_init ./incl/views/header.sh 
    line "OK"
    line "Iniciando script"
    clear
    sh ./incl/views/header.sh 
}

init_script



