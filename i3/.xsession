#!/bin/sh

#
# Run on login
#

# autostart a graphical authentication agent
/usr/bin/lxpolkit &

# configure keyboard toggle
setxkbmap -option 'grp:alt_shift_toggle'

# set environment variables
export TERMINAL=st
export QT_QPA_PLATFORMTHEME=gtk2
#set ibus input variables
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -drx

# Start applications
# start compositor
picom &

# start network-manager applet
nm-applet &

# start udisk frontend with tray
udiskie --tray &

# start notification-daemon
dunst &

# start conky and use file in user's configuration directory
#conky -c ~/.config/conky/conky.conf &

# start bluetooth control frontend
#blueman-applet &

