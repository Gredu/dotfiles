
# set the cursor
xsetroot -cursor_name left_ptr

# set Finnish programming keyboard layout
# source: https://eagleflow.fi/posts/2015-01-10/keyboard-layout
setxkbmap -option caps:escape -layout fi -variant programmer

# use caps for escaping
setxkbmap -option caps:swapescape

# no mouse accelaration
xset m 0 0

# do not turn off monitors
xset s off -dpms

# three screen setting
xrandr --output HDMI-1 --primary --output DP-1 --right-of HDMI-1

# start xmonad
exec xmonad
