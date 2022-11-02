#!/bin/bash
clear
BRANCH_TAG=$(git rev-parse --abbrev-ref HEAD)
echo "----------------------------------- RESET $BRANCH_TAG"
git add .
git commit -m "LIXO"
git fetch origin && \
git reset --hard origin/$BRANCH_TAG
echo "----------------------------------- RESET CONCLUIDO"
echo