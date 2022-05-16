#!/bin/sh

if [ $1 = "desktop" ]; then

	xmodmap -e "keycode 94 = 0x40 0x23" # map '@' and '#' to the upper left button
	xmodmap -e "keycode 49 = 0x3c 0x3e" # map '<' and '>' to the bottom left button
  echo "Keyboard layout changed to desktop mode"
  
elif [ $1 = "laptop" ]; then

	xmodmap -e "keycode 49 = 0x40 0x23" # map '@' and '#' to the upper left button
	xmodmap -e "keycode 94 = 0x3c 0x3e" # map '<' and '>' to the bottom left button
	echo "Keyboard layout changed to laptop mode"
	
else

  echo "Fix error: $ ./changeKeyboardLayout.sh <desktop/laptop>"
  
fi

#################
# xmodmap guide #
#################

# xmodmap -e "keycode <keycode> = <keysym for character> <keysym for shoft+character>"

# Keycodes (for physical buttons)
	# Button (upper left) with the '@' and '#' symbols = 94
	# Button (bottom left) with the '<' and '>' symbols = 49

# Keysyls (for ascii characters)
# '@' = 0x40
# '#' = 0x23
# '<' = 0x3c
# '>' = 0x3e
