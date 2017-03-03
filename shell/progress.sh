#!/bin/bash
COUNTER=0
_R=0
_C=`tput cols`
_PROCEC=`tput cols`
tput cup $_C $_R
printf "["
while [ $COUNTER -lt 100 ]
do
    COUNTER=`expr $COUNTER + 1`
    sleep 0.1
    printf "=>"
    _R=`expr $_R + 1`
    _C=`expr $_C + 1`
    tput cup $_PROCEC 101
    printf "]%d%%" $COUNTER
    tput cup $_C $_R
done
printf "\n"
