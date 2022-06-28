# bash render.sh localPathToBlendFile.blend sd (shutdown = optional)
# this script renders the blend file and send a notification to my phone when the render is done with how long the render took
# add the 'sd' parameter to shut down when the render is finished

# TODO
# Only renders the whole animation for now

# ask to shut down afterwards or not 
# echo
# echo "> Shutdown (ENTER) when finished or not (ANYTEXT)"
# read shutdown
# echo

# get arguments
relativePath=$1
shutdown=$2

# get seconds since epoch
secondsStart=$(date +%s)

# render in background
flatpak run org.blender.Blender -b "$PWD/$relativePath" -a

# get seconds since epoch again
secondsEnd=$(date +%s)

# calculate how long the render took
let renderSeconds=$secondsEnd-$secondsStart

# convert seconds to readable time
let hours=$renderSeconds/3600
renderSeconds=$renderSeconds%3600
let minutes=$renderSeconds/60
renderSeconds=$renderSeconds%3600
let seconds=$renderSeconds%60
echo "Render time: $hours:$minutes:$seconds"

# send notification to phone
title="$relativePath"
message="$hours:$minutes:$seconds"

title="${title// /_}"     # remove spaces, they don't work with notifyPhone.sh
message="${message// /_}" # remove spaces, they don't work with notifyPhone.sh

/home/hanne/Documents/Linux/Universal/scripts/notifyPhone.sh $title $message

# shut down in 3 minutes
if [ "$shutdown" == "sd" ]; then
	shutdown -P +3
fi
