#!/bin/bash

# Phil Maurer 9.19.2020 V 1.0
# phil@m4urer.com
# This is a script to update kali Linux, it can be used on other debian based distro's, please read comments.


# Notes:
#  APT WARNING
#   "apt update" will give a warning not to use apt in scripts, I have verified that the apt commands in this
#   script work with no issues. You can change all instances of "apt" to "apt-get" and it will work. I researched 
#   the commands I put in, and they are fine. I feel the app-get does not show the progress of commands as clearly.
#   You may change them if you feel safer
#
# EXPLIOTDB WARNING
#   If you are not on Kali or do not want the 16gb(?) download of the write up archives of exploitdb of searchsploit
#   Please comment out the searchsploit -u section.

clear
echo -e "\e[38;5;82mStarting update in 5 seconds"

#timer
for i in {5..00}
do
tput cup 2 $l
echo -n "$i"
sleep 1
done
echo
#end timer
tput cup 2
echo "GO!"



# Best practice to make sure no broken installs or updates are in the cue.
echo " "
echo -e "\e[38;5;82mChecking for unfinished updates\e[0m"
apt --fix-broken install -y


# Looking up outdated files and downloading
echo " "
echo -e "\e[38;5;82mChecking for available updates and downloading\e[0m"
apt update


# This saves the results of what is able to be upgraded by the upgrade command.
# Or you can modify this to display here and not at the end by removing " > tempupdated.txt"
#echo " "
#echo -e "\e[38;5;82mThese files will be updated\e[0m"
apt list --upgradable > tempupdated.txt


# These 2 commands run the 2 different updgrades. Running them in this order ensures complete updates
echo " "
echo -e "\e[38;5;82mInstalling updates\e[0m"
#apt upgrade -y 
#echo " "
apt dist-upgrade -y 

# Update SearchSploit
#   If you are not using Kali, or do not want the expliotdb comments this out.
echo " "
echo -e "\e[38;5;82mUpdating Searchsploit\e[0m"
searchsploit -u



# Clean up to remove unneeded packages
echo " "
echo -e "\e[38;5;82mCleaning up\e[0m"
apt autoremove -y
echo " "
apt autoclean -y


echo "  " 
echo -e "\e[38;5;82mPlease check  above for update notes\e[0m"



# Displays then removes the results of the apt --upgradeable.  Comment out if you commented out the top as well.
echo " "
echo -e "\e[38;5;82mThese files have been updated\e[0m"
echo " "
# Tails displays the contents of the file starting at line 2 to remove some unneeded formatting.
tail -n +2 tempupdated.txt
rm tempupdated.txt
echo -e "\e[38;5;82mDone!\e[0m"
