#!/bin/sh

sxhkd -c /etc/osafi/sxhkd/sxhkdrc &
exec bspwm -c /etc/osafi/bspwm/bspwmrc
