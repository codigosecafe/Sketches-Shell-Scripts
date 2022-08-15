#!/bin/bash
UP_MYSQL=$(/etc/init.d/mysql status | grep -o "is not running")
if [ "$UP_MYSQL" = "is not running" ]; then 
        echo "--------------------------------------: MYSQL IS DOWN.";
        sudo /etc/init.d/mysql restart
fi;
