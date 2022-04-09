#!/bin/bash


#########   4/08/2022  Phil Maurer  phil@m4urer.com   #########
###                                                         ###
### TEMPERATURE ALERT TO SLACK - SCRIPT FOR RASPBERRY PI'S  ###
###                                                         ###
###       Free to use but please include attribution        ###
###                                                         ###
###########################  V 1.1  ###########################


# Version 1.0 -- 3.13.2022 - Initial version
# Version 1.1 -- 4.08.2022 - Added multiple triggers at different temperatures
#                            Added webhook into a variable

#### NOTES ####
# To get your Slack channel please go to https://api.slack.com/slack-apps
# Then create a webapp and then create the webhook for your own slack.
#
# Do not forget to set it to run using crontab!!!  I suggest every 10 minutes


# This is to set your slackhook. See URL below for how to obtain one.
# https://api.slack.com/messaging/webhooks if you ignored the above note.
slackhook=<INSERT YOUR WEBHOOK URL>


# This calls the temp in C*1000 and stores it in a varible TC
tc=$(</sys/class/thermal/thermal_zone0/temp)

# This is for testing the script to ensure it functions if triggered.
#tc=45000

if [[ $tc -gt 54444 ]]
then
        curl -X POST -H 'Content-type: application/json' --data '{"text":"!!!WARNING!!! The Pi server has exceeded 54C/ 130F - Please check!   !!!WARNING!!!"}' $slackhook

elif [[ $tc -gt 51666 ]]
then
        curl -X POST -H 'Content-type: application/json' --data '{"text":"WARNING: The Pi server has exceeded 51C/ 125F - Please check!"}' $slackhook

elif [[ $tc -gt 48888 ]]
then
        curl -X POST -H 'Content-type: application/json' --data '{"text":"Alert: The Pi server has exceeded 48C/ 120F - Please check!"}' $slackhook

elif [[ $tc -gt 46111 ]]
then
        curl -X POST -H 'Content-type: application/json' --data '{"text":"The Pi server has exceeded 46C/ 115F - Please check!"}' $slackhook

elif [[ $tc -gt 43333 ]]
then
        curl -X POST -H 'Content-type: application/json' --data '{"text":"The Pi server has exceeded 43C/ 110F - Please check!"}' $slackhook

fi
