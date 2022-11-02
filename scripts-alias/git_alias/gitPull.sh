#!/bin/bash
clear
BRANCH_TAG=$(git rev-parse --abbrev-ref HEAD)
BRANCH_TITLE=$(git rev-parse --abbrev-ref HEAD | cut -d / -f 2 | sed 'y/abcdefghijklmnopqrstuvwxyz-/ABCDEFGHIJKLMNOPQRSTUVWXYZ /')
echo "----------------------------------- PULL ORIGIN $BRANCH_TITLE"


git pull origin $BRANCH_TAG
echo "----------------------------------- PULL FINALIZADO"
echo
