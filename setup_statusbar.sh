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
. "$FUNC_DIR/bar_functions/dwm_private_ip.sh"
. "$FUNC_DIR/bar_functions/dwm_volume_alsa.sh"
. "$FUNC_DIR/bar_functions/dwm_brightness.sh"
. "$FUNC_DIR/bar_functions/dwm_battery.sh"


# Initialize variables with initial values
volume=$(dwm_volume_alsa)
brightness=$(dwm_brightness)
battery=$(dwm_battery)
private_ip=$(dwm_private_ip)
date_time=$(dwm_date_time)

while true; do
    # Update volume every 1 second
    volume=$(dwm_volume_alsa)
    status_bar=" $volume $SEP "

    # Update other functions every 60 seconds
    if (( SECONDS % 60 == 0 )); then
        brightness=$(dwm_brightness)
        battery=$(dwm_battery)
        private_ip=$(dwm_private_ip)
        date_time=$(dwm_date_time)
    fi
    
    # Append all function outputs to status bar
    status_bar="$status_bar$brightness $SEP "
    status_bar="$status_bar$battery $SEP "
    status_bar="$status_bar$private_ip $SEP "
    status_bar="$status_bar$date_time "

    # Update the status bar
    xsetroot -name "$status_bar"

    # Wait for 1 second before repeating the loop
    sleep 1
done



