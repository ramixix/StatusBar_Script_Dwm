#!/bin/sh
# Show the master volume of ALSA

# Dependencies: alsa-utils
dwm_alsa () {
	STATUS=$(amixer sget Master | tail -n1 | sed -r "s/.*\[(.*)\]/\1/")
    VOL=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")

    if [ "$USE_EMOJIES" = "true" ]; then
    	if [ "$STATUS" = "off" ]; then
	            printf " M"
    	else
			if [ "$VOL" -eq 0 ]; then
				printf " 0%%"
	        elif [ "$VOL" -gt 0 ] && [ "$VOL" -le 60 ]; then
	            printf " %s%%" "$VOL"
	        else
	            printf " %s%%" "$VOL"
	        fi
		fi
    else
    	if [ "$STATUS" = "off" ]; then
    		printf "MUTE"
    	else
	        if [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
	            printf "VOL %s%%" "$VOL"
	        elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
	           printf "VOL %s%%" "$VOL"
	        else
	            printf "VOL %s%%" "$VOL"
        	fi
        fi
    fi
}
