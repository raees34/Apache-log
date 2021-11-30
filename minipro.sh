#!/bin/bash
#################
## Apache logs ##
#################
green='\e[32m'
blue='\e[34m'
clear='\e[0m'
orange='\e[33m'
red='\e[31m'

ColorGreen(){
	echo -ne $green$1$clear
}
ColorBlue(){
	echo -ne $blue$1$clear
}
ColorRed(){
	echo -ne $red$1$clear
}
ColorOrange(){
	echo -ne $orange$1$clear
}

echo $(ColorOrange " APACHE logger \n");
echo $(ColorGreen " Author : raees   \n ");



awk '{print $1}' accesslog.txt > usrip.txt # gatharing ip's from log file
echo "Start!"
for (( i=0; i<=20; i++));# loop for shedule time
 do 
  while read p;          
    do
     if [[ $(< usrip.txt) != "$p" ]]; then # compare ip (old/new)
    
    echo "ip dont matching"
fi
    
    curl "https://ipstack.com/?utm_source=any-api&utm_medium=$p" >> userdetail.txt # curl api data
    echo "$p"
    done <usrip.txt
$i ;sleep 60; # shedule timer for 1 minute
done

