#!/bin/bash

CHOICE=$(echo "🔒 Lock Session
⏾ Suspend Session
⍇ Logout
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
	"🔒 Lock Session")
		xset s activate
		;;
	"⏾ Suspend Session")
		systemctl suspend
		;;
	"⍇ Logout")
		choice=confirm_choice $CHOICE
		if [ "$(confirm_choice $CHOICE)" = "go" ]; then
			case "$GDMSESSION" in
				"i3")
					i3-msg exit
					;;
				"herbstluftwm")
					herbstclient quit
					;;
				"bspwm")
					bspc quit
					;;
				*)
					rofi -e "WM not identified"
					;;
				esac
		else
			exit
		fi
		;;
	" Restart")
		if [ $(confirm_choice $CHOICE) = "go" ]; then
			reboot
		else
			exit
		fi
		;;
	" Shutdown")
		if [ $(confirm_choice $CHOICE) = "go" ]; then
			poweroff
		else
			exit
		fi
		;;
	*)
		rofi -e "Huh?"
		;;
esac
