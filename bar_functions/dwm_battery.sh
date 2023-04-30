#!/bin/sh

# Read the battery level and status

dwm_battery () {
    # Find battery path to read information
    POWER_SUP_PATH="/sys/class/power_supply"
    if [ -d "$POWER_SUP_PATH/BAT0" ];then
        BATTERY_NAME="BAT0"
    elif [ -d "$POWER_SUP_PATH/BAT1"];then
        BATTERY_NAME="BAT1"
    else
        printf "Battery Not Detected"
        return
    fi
    
    CHARGE=$(cat $POWER_SUP_PATH/$BATTERY_NAME/capacity)
    STATUS=$(cat $POWER_SUP_PATH/$BATTERY_NAME/status)

    if [ "$USE_EMOJIES" = "true" ]; then
        if [ "$STATUS" = "Charging" ]; then
            printf "🔌 %s%% %s" "$CHARGE" "$STATUS"
        else
            printf "🔋 %s%% %s" "$CHARGE" "$STATUS"
        fi
    else
        printf "BAT %s%% %s" "$CHARGE" "$STATUS"
    fi
}