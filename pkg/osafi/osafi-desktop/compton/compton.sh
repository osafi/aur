#!/bin/sh

# Terminate already running compton
killall -q compton
while pgrep -u $UID -x compton >/dev/null; do sleep 1; done

compton --config /etc/osafi/compton/compton.conf &