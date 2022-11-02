#!/bin/bash
clear
BRANCH_TAG=$(git rev-parse --abbrev-ref HEAD)
echo "----------------------------------- LOG DA BRANCH: $BRANCH_TAG"
echo
git log --pretty=format:'%C(yellow)>> %h <<%C(red)%d %C(white)| %C(green)%s %C(white)| %cn >> %C(cyan)%cr'
echo
echo "----------------------------------- ESSES SÃO SEUS LOGS"
echo