#! /bin/bash

#This is a simple script to bring wifi out of monitor mode
#usefull after running airmon-ng

#phil@m4urer.com
#5/13/2021
#v1.0

airmon-ng stop wlan0
echo "Wifi Available, please connect to local wifi"
echo " "
