#!/bin/sh

# bash notifyPhone.sh title message
title=$1
message=$2

# api call
curl --request POST\
		 --url 'https://api.simplepush.io/send'\
		 --data '{"key": "odJQzW", "title": "'$title'", "msg": "'$message'"}'
