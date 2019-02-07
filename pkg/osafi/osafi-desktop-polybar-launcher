#!/bin/sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar -c /etc/osafi/polybar/config main 2> ~/.polybar.err > ~/.polybar.out &

echo "Polybar launched..."
