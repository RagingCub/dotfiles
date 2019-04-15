#!/usr/bin/env bash

# Launch barBottom on all monitors
amixer set Capture toggle

# get new microphone state and notify
STATUS=$(amixer get Capture | grep -Eom1 "\[(on|off)\]")
notify-send "Microphone state now $STATUS"

