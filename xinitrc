
# set the cursor
xsetroot -cursor_name left_ptr

# set German keyboard layout
setxkbmap -layout fi

# change to the custom keyboard layout
xmodmap ~/dotfiles/keymap-simple

# no mouse accelaration
xset m 0 0

# start dropbox
dropbox start

# setting dual screens
# xrandr --auto --output DVI-1 --mode 1680x1050 --left-of DVI-0 --output DVI-0 --primary
xrandr --auto --output DVI-I-3 --mode 1680x1050 --left-of DVI-I-2 --output DVI-I-2 --primary

# start xmonad
exec xmonad
