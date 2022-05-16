#!/bin/sh

ping -c 1 192.168.1.15 # -c = count, so ping once
if [ "$?" -ne 0 ]; then
	notify-send "Raspberry Pi: OFFLINE"
else
	notify-send "Raspberry Pi: ONLINE"
fi
