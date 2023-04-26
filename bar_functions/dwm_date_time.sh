#!/bin/sh

# Shows the current date and time

# Date format: "[WeekdayName (MonthName-MM) DD Hour:Min am/pm]"
dwm_date_time () {
    if [ "$USE_EMOJIES" = "true" ]; then
        printf "📆 %s" "$(date "+%a %d %b-%m %H:%M %P")"
    else
        printf "D&T %s" "$(date "+%a %d %b-%m %H:%M %P")"
    fi
}