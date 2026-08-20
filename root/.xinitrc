
# set the cursor
xsetroot -cursor_name left_ptr

# set Finnish programming keyboard layout
# source: https://eagleflow.fi/posts/2015-01-10/keyboard-layout
# setxkbmap -option caps:escape -layout fiWithProgrammer -variant programmer
setkb

# use caps for escaping
setxkbmap -option caps:swapescape

# no mouse accelaration
xset m 0 0

# do not turn off monitors
xset s off -dpms

# two screen setting
xrandr --output HDMI-0 --primary --output DP-3 --right-of HDMI-0

# make DISPLAY/XAUTHORITY visible to systemd-user and dbus-activated services
# (fixes xdg-desktop-portal-gtk failing with "cannot open display")
systemctl --user import-environment DISPLAY XAUTHORITY
dbus-update-activation-environment --systemd DISPLAY XAUTHORITY

# start xmonad
exec xmonad
