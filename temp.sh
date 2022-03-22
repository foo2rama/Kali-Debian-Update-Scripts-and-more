#!/bin/bash

#########   2/27/2022  Phil Maurer  phil@m4urer.com   #########
###                                                         ###
###      SIMPLE TEMPERATURE SCRIPT FOR RASPBERRY PI'S       ###
###                                                         ###
###       Free to use but please include attribution        ###
###                                                         ###
###########################  V 2.0  ###########################


#   A Simple script to display the temp of the arm processor. This works on
# a Rasp Pi and has been tested on a Rasp Pi 4 on Ubuntu 20.04 and will work
# on raspian and debian based distros, and hopefully other distros.

# Version 1.0 - 8/14/2020 - Initial version
#        1.1 - 10/4/2020 - added non color version
#        2.0 - 2/27/2022 - added if statements to change color depending
#                          on heat level


#                        ###  NOTES ###
#   If you want to cut and paste this into a script that you will be logging
# into a text file then you need to remove the color flags otherwise it will
# not display correctly, and include the color formatting. The best thing to
# to do is just comment out the one below and uncomment the one at the bottom

# The current settings are 46C (46000) for cool and 60C (60000) for hot,
# you can adjust as needed for your personal setup.


tc=$(</sys/class/thermal/thermal_zone0/temp)


if [[ $tc -lt 46000 ]]
then
        echo -e  "\e[92mThe Cpu Temp is \e[96m$((tc/1000))C""\e[96m/$((tc/1000 * 9/5  + 32))F\e[0m"


elif [[ $tc -gt 60000 ]]
then
        echo -e  "\e[92mThe Cpu Temp is \e[91m$((tc/1000))C""\e[91m/$((tc/1000 * 9/5  + 32))F\e[0m"


else
        echo -e  "\e[92mThe Cpu Temp is \e[93m$((tc/1000))C""\e[93m/$((tc/1000 * 9/5  + 32))F\e[0m"

fi




###   No color script for logging   ###
# Use This if you make your own script that goes into a log without color tags


#tc=$(</sys/class/thermal/thermal_zone0/temp)
#echo "The Cpu Temp is $((tc/1000))c""/$((tc/1000 * 9/5  + 32))f"
