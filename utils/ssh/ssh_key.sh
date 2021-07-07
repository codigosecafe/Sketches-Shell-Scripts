#!/bin/bash
echo "\n\n"
echo "#=============================================================================="
echo "# title       : SSH KEY"
echo "# description : Script para gerar ssh key"
echo "# author      : Claudio Alexssandro Lino"
echo "# github      : https://github.com/codigosecafe"
echo "# version     : 1.0.0"
echo "#=============================================================================="
echo "\n"
cd ~/
mkdir .ssh
echo "\n"
cd .ssh
echo -n "# => Qual seu nome? "
read nomesshkey
echo "\n"
echo -n "# => Qual seu email? "
read emailsshkey
echo "\n"

ssh-keygen -t rsa -b 4096 -C "$emailsshkey"

eval "$(ssh-agent -s)"
cp ~/script-up-server/utils/ssh/config ~/.ssh/config
ssh-add ~/.ssh/deploy


echo "\n"

cat ~/.ssh/id_rsa

git config --global user.name "$nomesshkey"
git config --global user.email "$emailsshkey"
git config --global color.ui auto