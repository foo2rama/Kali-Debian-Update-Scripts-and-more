#!/bin/bash


#########   10/4/2020  Phil Maurer  phil@m4urer.com   #########
###                                                         ###
###      SIMPLE TEMPERATURE SCRIPT FOR RASPBERRY PI'S       ###
###                                                         ###
###     Feel free to use but please include attribution     ###
###                                                         ###
###########################  V 1.0  ###########################


#   A Simple script to display the temp of the arm processor. This works on
#a Rasp Pi and has been tested on a Rasp Pi 4 on Ubuntu 20.04 and will work
#on raspian and debian based distros, and hopefully other distros.

## NOTES ##
#   If you want to cut and paste this into a script that you will be logging
#into a text file then you need to remove the color flags otherwise it will
#not display correctly, and include the color formatting. Just comment out
#the one below and uncomment the one at the bottom


tc=$(</sys/class/thermal/thermal_zone0/temp)
echo -e  "\e[96mThe Cpu Temp is \e[31m$((tc/1000))C""\e[31m/$((tc/1000 * 9/5  + 32))F\e[0m"


#Use This if you make your own script that goes into a log without color tags
#tc=$(</sys/class/thermal/thermal_zone0/temp)
#echo "The Cpu Temp is $((tc/1000))c""/$((tc/1000 * 9/5  + 32))f"
