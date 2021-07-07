#!/bin/bash
echo "\n\n"
echo "#=============================================================================="
echo "# title       : REMOVE REDIS"
echo "# description : Script para remover do REDIS"
echo "# author      : Claudio Alexssandro Lino"
echo "# github      : https://github.com/codigosecafe"
echo "# version     : 1.0.0"
echo "#=============================================================================="
echo "\n"

cd ~/
rm -rf redis*
apt-get remove --purge redis*
apt-get purge redis*
apt-get autoremove
apt-get autoclean

echo "\n"
echo "#=========================== FIM DO SCRIPT ===================================="
echo "\n\n"
exit 