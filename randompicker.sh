#!/bin/bash
#
# A simple script to pick names from a list.
# Phil Maurer
# phil@m4urer.com
# v 1.0 - 7.13.2021
#
# Instructions: The names.txt file needs to have one name on each
#               line.  Of course you can put any data if you want
#
# note : You will have to change the absolute pathing depending on
#        where you place it.  If you decide to run it via alias you
#        really need the absolute path to the name file.
#        ***(I highly recommend running it as an alias)***

clear
echo " "
echo " "
echo -e "and the winner is ...\e[92m"
echo " "
shuf -n 1 /home/sysadmin/Desktop/picker/names.txt
echo -e " \033[0m"
echo " "
