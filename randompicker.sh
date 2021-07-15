#!/bin/bash
#
# A simple script to pick names from a list. Or a line from a 
# file depending on how you look at it.
#
# Phil Maurer
# phil@m4urer.com
# v 1.1 - 7.15.2021
#
# Instructions: The names.txt file needs to have one name on each
#               line.  Of course you can use any data if you want.
#
# note : You will have to change the absolute pathing depending on
#        where you place it.  If you decide to run it via alias you
#        really need the absolute path to the name file.
#        ***(I highly recommend running it as an alias)***

NAMES=$HOME/Documents/picker/names.txt
tput clear
echo -e "\n\nAnd the winner is ...\n"
tput setaf 2
shuf -n 1 "$NAMES"
tput setaf 0
echo
