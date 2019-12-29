#!/bin/bash

CHOICE=$(echo 'Inbuilt  [eDP1]
Switch To External  [HDMI1]
Cast To External 
Extend Display  + ' | rofi  \
	-config ~/.config/rofi/display_switch_config  \
	-dmenu -p "Select Display Mode")
[[ -z $CHOICE ]] && exit

case "$CHOICE" in
	'Inbuilt  [eDP1]')
		autorandr --load home
		;;
	'Switch To External  [HDMI1]')
		autorandr --load external_only
		;;
	'Cast To External ')
		autorandr --load screencast
		;;
	'Extend Display  + ')
		autorandr --load presentation
		;;
	*)
		autorandr --load home
		;;
esac
