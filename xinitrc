
# set the cursor
xsetroot -cursor_name left_ptr

# set German keyboard layout
setxkbmap -layout fi

# change to the custom keyboard layout
xmodmap ~/.xmodmap-swapper

# no mouse accelaration
xset m 0 0

# setting dual screens
xrandr --auto --output DVI-0 --mode 1680x1050 --left-of DVI-1 --output DVI-1 --primary

# start xmonad
exec xmonad
