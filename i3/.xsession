#!/bin/sh

#
# Run on login
#

# autostart a graphical authentication agent
/usr/bin/lxpolkit &

# configure keyboard toggle
setxkbmap -layout us,ca -option 'grp:alt_shift_toggle'

# load the wallpaper on login
~/.fehbg &

# set environment variables
export TERMINAL=st
export QT_QPA_PLATFORMTHEME=gtk2

# Start applications
# start compositor
compton -CG &

# start network-manager applet
nm-applet &

# start udisk frontend with tray
udiskie --tray &

# start conky and use file in user's configuration directory
#conky -c ~/.config/conky/conky.conf &

# start bluetooth control frontend
#blueman-applet &

