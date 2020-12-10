#!/bin/bash

# Phil Maurer 9.01.2020 V 1.0
# phil@m4urer.com
# This is a script to reset dhcp credentials




echo " "
echo -e "\e[38;5;82mGetting new DHCP\e[0m"
sudo dhclient -r
sudo dhclient
echo -e "\e[38;5;82mCompleted\e[0m"

echo " "
echo -e "\e[38;5;82mLocal IP\e[0m"
hostname -I | awk '{print $1}'
echo " "

echo -e "\e[38;5;82mExternal IP\e[0m"
dig +short myip.opendns.com @resolver1.opendns.com
echo " "
