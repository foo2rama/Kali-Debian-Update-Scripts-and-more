#!/bin/bash


# Phil Maurer 8.17.2020 V 1.0
# phil@m4urer.com
# This is a script to grab the IP and external IP of the machine in use.

echo -e "\e[38;5;82mLocal IP\e[0m"
hostname -I | awk '{print $1}'
echo " "
echo -e "\e[38;5;82mExternal IP\e[0m"
dig +short myip.opendns.com @resolver1.opendns.com
echo " "
