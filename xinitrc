
# set the cursor
xsetroot -cursor_name left_ptr

# set Finnish programming keyboard layout
# source: https://eagleflow.fi/posts/2015-01-10/keyboard-layout
setxkbmap -layout fi -variant programmer

# no mouse accelaration
xset m 0 0

# start dropbox
dropbox start &

# three screen setting
xrandr --output DVI-D-1 --left-of DVI-I-1 --output DVI-I-1 --primary --output HDMI-1 --mode 1680x1050 --set underscan on --set "underscan vborder" 34 --set "underscan hborder" 52 --same-as DVI-I-1

# start xmonad
exec xmonad
