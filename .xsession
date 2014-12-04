# set the cursor
xsetroot -cursor_name left_ptr

# set German keyboard layout
setxkbmap -layout fi

# change to the custom keyboard layout
xmodmap ~/dotfiles/xmodmap-swapper

# start xmonad
exec xmonad
