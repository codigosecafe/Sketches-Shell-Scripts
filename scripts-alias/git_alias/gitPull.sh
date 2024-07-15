#!/bin/bash
clear
BRANCH_TAG=$(git rev-parse --abbrev-ref HEAD)
BRANCH_TITLE=$(git rev-parse --abbrev-ref HEAD | cut -d / -f 2 | sed 'y/abcdefghijklmnopqrstuvwxyz-/ABCDEFGHIJKLMNOPQRSTUVWXYZ /')
echo "----------------------------------- PULL ORIGIN $BRANCH_TITLE"
case $1 in
f|-f|force|--force) git pull -f origin $BRANCH_TAG ;;
help|h|-h|--help) echo "Argumentos válidos: f - pull forçado." ;;
*) git pull origin $BRANCH_TAG ;;
esac
echo "----------------------------------- PULL FINALIZADO"
echo