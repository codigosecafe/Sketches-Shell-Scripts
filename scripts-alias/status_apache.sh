#!/bin/bash
UP_APACHE=$(service apache2 status | grep -o "is not running")
if [ "$UP_APACHE" = "is not running" ]; then 
        echo "--------------------------------------: APACHE2 IS DOWN.";
        sudo service apache2 start
fi;

