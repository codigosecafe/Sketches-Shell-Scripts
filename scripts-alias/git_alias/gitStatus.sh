#!/bin/bash
clear
BRANCH_TAG=$(git rev-parse --abbrev-ref HEAD)
echo "----------------------------------- STATUS DA BRANCH: $BRANCH_TAG"
git status -s
echo "----------------------------------- ESSES SÃO ARQUIVOS ALTERADOS"
echo