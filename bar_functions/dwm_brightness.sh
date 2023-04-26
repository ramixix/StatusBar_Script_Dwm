#!/bin/sh

# Display the current screen brighness with xrandr

# Dependencies: xrandr (xorg-xrandr)

dwm_brightness () {
    Brightness_Value="$(xrandr --prop --verbose | grep -A 10 " connected" | grep "Brightness" | awk '{print $2}' | cut -d"." -f2)"
    printf "☀ %.0f\n" "$Brightness_Value" 
}
