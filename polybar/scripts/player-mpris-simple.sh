#!/bin/sh

player_status=$(playerctl status 2> /dev/null)

if [ "$player_status" = "Playing" ]; then
    echo "   $(playerctl metadata -f '%{T2}{{artist}}%{T-}') - $(playerctl metadata -f '%{T2}{{title}}%{T-}')"
elif [ "$player_status" = "Paused" ]; then
    echo "   $(playerctl metadata -f '%{T2}{{artist}}%{T-}') - $(playerctl metadata -f '%{T2}{{title}}%{T-}')"
else
    echo " "
fi
