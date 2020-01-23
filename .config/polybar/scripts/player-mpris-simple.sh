#!/bin/sh

player_status=$(playerctl status 2> /dev/null)

if [ "$player_status" = "Playing" ]; then
    echo "%{F#7FFF00}♪%{F-} $(playerctl metadata -f '%{T2}{{artist}}%{T-}') - $(playerctl metadata -f '%{T2}{{title}}%{T-}')"
elif [ "$player_status" = "Paused" ]; then
    echo "%{F#7FFF00}♪%{F-}%{F#777777} $(playerctl metadata -f '%{T2}{{artist}}%{T-}') - $(playerctl metadata -f '%{T2}{{title}}%{T-}')%{F-}"
else
    echo " "
fi
