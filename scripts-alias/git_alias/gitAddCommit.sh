#!/bin/bash
clear
BRANCH_TAG=$(git rev-parse --abbrev-ref HEAD)
BRANCH_TITLE=$(git rev-parse --abbrev-ref HEAD | cut -d / -f 2 | sed 'y/abcdefghijklmnopqrstuvwxyz-/ABCDEFGHIJKLMNOPQRSTUVWXYZ /')
MESSAGE="$1"
echo "[$BRANCH_TITLE]-$MESSAGE"
git add --all && \
git commit -am "[$BRANCH_TITLE]-$MESSAGE"
echo
