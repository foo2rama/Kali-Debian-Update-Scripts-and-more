# **Welcome to my Rasberry Pi and other Debian based scripts** #


This is a collection of scripts that I use on a daily basis. Some are Kali and Parrot specific, others are highly specific to Raspberry Pi's and the temperature variables on them.  All scripts work in a Debian based environment, other distros and your results will vary.  Please note any of the update scripts will fail in anything other then a debian based distribution.

Nothing truly special and some are very very simple, simple to the point of why are you even sharing this.  I do this as in addition to my day job as a Compliance Auditor, I also teach Cybersecurity and I want my students to be able to see what can be easily automated.




Please feel free to use and distribute, as long as you leave attribution in the comments

# **Scripts** #

*RaspberryPiTempScript* - A simple script with color coding to to display the temp of your raspberry PI.  It also contains a version that can be used in logging.  This displays in both C and F.

*Cronupdate* - An overnight update script with logging.  As configured it updates any debian system correctly, log what was updated, logs raspberry pi temps, and if you have vnstat installed it will log a summery of network traffic.  

*Kaliupdate* - An update script for updating a Kali VM or machine.  It has options for various options within kali.

*myip* - A simple script that displays your local and public IP address.  More usefull then you would think. Also there are about 20 different ways to do this.

*tempalertcronscript* - A nice little script to send temperature alerts to your own personal slack, this is much easier to configure then you would think.

*wifiup.sh* - A script to reset your wifi after running airmon-ng and take it out of promiscious or monitor mode, this is very usefull if you do alot of wifi pentesting with airmon-ng 

*resetdhcp* - A quick script to reset dhcp then reports back your local and public IP's

*randompicker.sh* - Script to randomly pick a name from a list of names.  Super usefull if you teach.
