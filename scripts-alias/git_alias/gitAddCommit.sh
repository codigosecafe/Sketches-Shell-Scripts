#!/bin/bash
clear
BRANCH_TAG=$(git rev-parse --abbrev-ref HEAD | cut -d / -f 2 | sed 'y/abcdefghijklmnopqrstuvwxyz-/ABCDEFGHIJKLMNOPQRSTUVWXYZ /')
MESSAGE="$1"
echo "[$BRANCH_TAG]-$MESSAGE"
git add . && \
git commit -am "[$BRANCH_TAG]-$MESSAGE"
echo
