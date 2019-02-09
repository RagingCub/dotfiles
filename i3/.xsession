#!/bin/sh

#
# Run on login
#

# autostart a graphical authentication agent
/usr/bin/lxpolkit &

# load the wallpaper on login
~/.fehbg &

