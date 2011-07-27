#!/bin/bash
# checkskyperunning.sh
# iye (iye.cba@gmail.com) jan 2011

# DESCRIPTION: Skype has two annoying bugs. One where if launched while already
# running, the autologin option is unset. The other is 100% CPU usage that it
# takes ages to open a console and kill it.
# This script will launch skype only if it's not already running and with the
# lowest priority.

programName=skype

psOutput=`pgrep -l $programName | grep -wc $programName`

if  [ $psOutput -ge 1 ];then
    gdialog --title Warning --msgbox "$programName Already Running" 50 20
else
    # $programName &
    # If output is not redirected to /dev/null the bash instance will remain running
    # as long as skype does.
    nohup nice -n 19 /home/skypeuser/bin/skype-2.2.0.25/skype > /dev/null 2> /dev/null < /dev/null &

fi

exit 0

