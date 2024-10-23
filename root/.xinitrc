
# set the cursor
xsetroot -cursor_name left_ptr

# set Finnish programming keyboard layout
# source: https://eagleflow.fi/posts/2015-01-10/keyboard-layout
setxkbmap -layout fi -variant programmer

# no mouse accelaration
xset m 0 0

# do not turn off monitors
xset s off -dpms

# three screen setting
xrandr --output DVI-D-1 --left-of DVI-I-1 --output DVI-I-1 --primary --output HDMI-1 --same-as DVI-I-1 

# start xmonad
exec xmonad
