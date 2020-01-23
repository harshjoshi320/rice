#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch mybar
echo "---" | tee -a /tmp/mybar.log
polybar BSPNU >>/tmp/polybar1.log 2>&1 &

echo "Bar launched..."
