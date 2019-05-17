#!/bin/sh

xrdb -override - <<EOF
URxvt*font: xft:MesloLGS Nerd Font Mono:pixelsize=36:minspace=False, xft:DejaVu Sans:pixelsize=24
URxvt*letterSpace: 0

URxvt*scrollBar: false

URxvt*background:   [97]#282a36
URxvt*foreground:   #eff0eb
URxvt*cursorColor:  #9aedfe

URxvt*color0:      #33303b
URxvt*color8:      #4f4b58
URxvt*color1:      #ff5c57
URxvt*color9:      #ff5c57
URxvt*color2:      #5af78e
URxvt*color10:     #5af78e
URxvt*color3:      #f3f99d
URxvt*color11:     #f3f99d
URxvt*color4:      #57c7ff
URxvt*color12:     #57c7ff
URxvt*color5:      #ff6ac1
URxvt*color13:     #ff6ac1
URxvt*color6:      #9aedfe
URxvt*color14:     #9aedfe
URxvt*color7:      #eff0eb
URxvt*color15:     #eff0eb

EOF
