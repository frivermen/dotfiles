# hsetroot -solid '#fbf1c7'
magick -size $(xrandr | grep '*' | head -n1 | awk '{print $1}') xc:'#fbf1c7' -font "Roboto-Mono-Medium" -pointsize 14 -fill '#3c3836' -gravity center -annotate +0+0 "$(cat /etc/hostname; cal -Y -m)" /tmp/calendar.png && feh --bg-center -B "#fbf1c7" /tmp/calendar.png
picom &
slstatus &
udiskie &
dunst &
zen-browser &
ciadpi -o1 -s4 -s6 -a1 &
Telegram &
xinput set-prop 'TPPS/2 IBM TrackPoint' 'libinput Accel Speed' -0.2
xbindkeys &
dwm
