#!/bin/bash

i3lock -e \
	-m \
	-n \
	--force-clock \
	--insidevercolor=31454777 \
	--insidewrongcolor=31454777 \
	--insidecolor=31454777 \
	--ringcolor=232627ff \
	--ringvercolor=f7cc42ff \
	--ringwrongcolor=cc0c23ff \
	--line-uses-inside \
	--keyhlcolor=00e59bff \
	--bshlcolor=f91403ff \
	--separatorcolor=232627ff \
	--verifcolor=fff9eeff \
	--wrongcolor=fff9eeff \
	--indpos="960:810" \
	--timestr="%I:%M %p" \
	--timecolor=fff9eeff \
	--timepos="960:540" \
	--time-align "0" \
	--time-font="Fira Sans" \
	--timesize=36 \
	--datestr="%A, %d/%m/%Y" \
	--datecolor=fff9eeff \
	--datepos="960:580" \
	--date-align="0" \
	--date-font="Fira Sans" \
	--datesize=24 \
	--veriftext="   Verifying..." \
	--wrongtext=" Wrong " \
	--noinputtext="  " \
	--radius=120 \
	--ring-width=10 \
	--image="Pictures/Japan/Shinjuku-Tokyo_sunset.jpg"
