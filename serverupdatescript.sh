#!/bin/bash

# Phil Maurer 4.15.2021 v1.4
# phil@m4urer.com

#   This is an overnight update script for debian based distros.  It needs to be run using <sudo cron>.
# This script also provides a log entry into a log file. You will need to modify the path to suit your
# your own needs, or comment out the echo's.
#
#   This was originally a script to update kali Linux, it can be used on other debian based distro's,
# please read comments for specific modifications. This has been modified for a raspberry pi 4 server
# running Ubuntu Server 20.04.


#  9.19.2020  v1.0 - Initial version
# 10.24.2020  v1.1 - Cleaned up some comments and and added consistancy to the log spacing
# 11.12.2020  v1.2 - Changed some wording added docker container status to the log
# 12.04.2020  v1.3 - Updated some commands for best practices
#  4.15.2021  v1.4 - added freemem command

# Notes:
#     APT WARNING
#   "apt list --upgradeable" will give a warning that apt is unstable for some reason. I have not had an
# issue with it and they way this script uses it should not cause instability.  I run this nightly with
# sudo crontab.  It will only show the error if you run the script manually.
#
#   This script also feeds to a log file you can comment out all echos, or you need to make the directory
# and or modify the script with the location of the log file.


# Best practice to make sure no broken installs or updates are in the que.
apt --fix-broken install -y


# Looking up outdated files and downloading
apt-get update


# This section sets up the log file that will record temp data, and network data.
# If this is not on a raspberry you need to take out the section on temps
# You also need to remove the section for vnstat if you have not installed it

echo " " >> /home/phil/mylogs/runningupdate.txt
echo " " >> /home/phil/mylogs/runningupdate.txt
echo "########*#*# AutoUpdate #*#*########" >>/home/phil/mylogs/runningupdate.txt
date >> /home/phil/mylogs/runningupdate.txt
echo " " >> /home/phil/mylogs/runningupdate.txt
# Inserts Raspberry Pi temp data
cpu=$(</sys/class/thermal/thermal_zone0/temp)
echo "The Cpu temp is $((cpu/1000))c""/$((cpu/1000 * 9/5  + 32))f" >> /home/phil/mylogs/runningupdate.txt
echo " " >> /home/phil/mylogs/runningupdate.txt

# Inserts Freemem
echo " " >> /home/phil/mylogs/runningupdate.txt
free >> /home/phil/mylogs/runningupdate.txt
echo " " >>/home/phil/mylogs/runningupdate.txt


# Inserts Docker data
## if you are not running docker containers then please comment out
docker ps >> /home/phil/mylogs/runningupdate.txt


# If you have not installed vnstat please comment out
vnstat -s >> /home/phil/mylogs/runningupdate.txt
echo " " >> /home/phil/mylogs/runningupdate.txt

# This is the line that will show the error if you manually run the script, it logs the updated files.
apt list --upgradable >> /home/phil/mylogs/runningupdate.txt
echo " " >> /home/phil/mylogs/runningupdate.txt


# These 2 commands run the 2 different updgrades. Running them in this order ensures complete updates.
# Full-upgrade can be disabled as it is not best practice on a server
apt-get upgrade -y
#apt-get full-upgrade -y


# Clean up and remove unneeded packages
apt-get autoremove -y
apt-get autoclean -y
