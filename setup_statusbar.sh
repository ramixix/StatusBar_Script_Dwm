#!/bin/bash

# Dependencies: xorg-xsetroot

# Store the directory where scripts are running from
LOC=$(readlink -f "$0")
FUNC_DIR=$(dirname "$LOC")

# If true it will use emojies instead of text 
# Requires a font with adequate unicode character support
export USE_EMOJIES="true"

# Separator character
export SEP="|"


# Import the modules
. "$FUNC_DIR/bar_functions/dwm_date_time.sh"
. "$FUNC_DIR/bar_functions/dwm_volume_alsa.sh"
. "$FUNC_DIR/bar_functions/dwm_battery.sh"

# Update dwm status bar every second
while true
do
    # Append results of each func one by one to the statusbar string
    status_bar=" "
    status_bar="$status_bar$(dwm_volume_alsa) $SEP "
    status_bar="$status_bar$(dwm_battery) $SEP "
    status_bar="$status_bar$(dwm_date_time)  "
    
    xsetroot -name "$status_bar"
    sleep 1
done
