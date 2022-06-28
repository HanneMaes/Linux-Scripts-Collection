#!/bin/sh

echo ""
echo "################"
echo "# raspberry pi #"
echo "################"
echo ""

# only try to ping my pi when we are on the same network
networkName=$(iwgetid -r)
echo "Connected to: $networkName"
echo ""

if [ $networkName == "Proximus-Home-4F80" ]; then
	# ping raspberry pi
	ping -c 5 192.168.1.19 # -c = count
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

echo ""
echo "####################"
echo "# apache webserver #"
echo "####################"
echo ""

ping -c 5 192.168.1.19 > /dev/null 2>&1 # -c = count, /dev/null ... means run command without output

if [ "$?" -ne 0 ]; then
	echo "Apache Webserver: OFFLINE"
else
	echo "Apache Webserver: ONLINE"
fi

echo ""
