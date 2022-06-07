#!/bin/sh

# only try to ping my pi when we are on the same network
networkName=$(iwgetid -r)
echo "Connected to: $networkName"
echo ""

if [ $networkName == "Proximus-Home-4F80" ]; then

	# ping raspberry pi
	ping -c 1 192.168.1.15 # -c = count, so ping once
	echo ""

	if [ "$?" -ne 0 ]; then
		#notify-send "Raspberry Pi: OFFLINE"
		echo	    "Raspberry Pi: OFFLINE"
	else
		#notify-send "Raspberry Pi: ONLINE"
		echo        "Raspberry Pi: ONLINE"
	fi
else
	echo "Not on the same network as Raspberri Pi"
fi
