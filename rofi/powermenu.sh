#!/bin/bash

CHOICE=$(echo " Lock Session
 Logout
 Restart
 Shutdown" | rofi  \
	-config ~/.config/rofi/powermenu_config  \
	-dmenu -p "Choose Power Option")
[[ -z $CHOICE ]] && exit

function confirm_choice {
	OP=$@
	ACTION=$(echo "$OP
Cancel" | rofi -config ~/.config/rofi/powermenu_config -dmenu -p "Confirm $OP")
	[[ -z $ACTION ]] && exit 1

	case "$ACTION" in
		"$OP")
			echo "go"
			;;
		"Cancel")
			echo "x"
			;;
		*)
			echo "x"
			;;
	esac
}
	
case "$CHOICE" in
	" Lock Session")
		~/.config/i3/i3lock-command.sh
		;;
	" Logout")
		choice=confirm_choice $CHOICE
		if [ "$(confirm_choice $CHOICE)" = "go" ]; then
			i3-msg exit
		else
			exit
		fi
		;;
	" Restart")
		if [ $(confirm_choice $CHOICE) = "go" ]; then
			rofi -e "rebooting"
		else
			exit
		fi
		;;
	" Shutdown")
		if [ $(confirm_choice $CHOICE) = "go" ]; then
			rofi -e "shutting down"
		else
			exit
		fi
		;;
	*)
		rofi -e "Huh?"
		;;
esac
