#!/bin/sh
# Requirement: xrandr (xorg-xrandr)

# Display the current screen brighness with xrandr

dwm_brightness () {
    Brightness_Value="$(xrandr --prop --verbose | grep -A 10 " connected" | grep "Brightness" | awk '{print $2}')"

    Ingeter_Part="$(echo $Brightness_Value | cut -d"." -f1)"
    Fractional_Part="$(echo $Brightness_Value | cut -d"." -f2)"


    if [[ $Ingeter_Part -eq 0 ]];then
        printf "☀ %.0f\n" "$Fractional_Part" 
    else
        printf "☀ %.0f00\n" "$Ingeter_Part" 
    fi
}