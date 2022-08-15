#!/bin/bash
#STATUS_SSH=$(ps ax | grep -c [s]sh-agent)
#if [ $STATUS_SSH -eq 0 ]; 
#then  
#   echo "--------------------------------------: KEY SSH IS DOW" 
#echo "-----: UP KEY SSH" 
#eval "$(ssh-agent -s)"
#ssh-add ~/.ssh/id_rsa
#fi
SSHAGENT=/usr/bin/ssh-agent
SSHAGENTARGS="-s"
if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
    eval "$(ssh-agent -s)"
    # trap "kill $SSH_AGENT_PID" 0
    ssh-add ~/.ssh/id_rsa
fi

