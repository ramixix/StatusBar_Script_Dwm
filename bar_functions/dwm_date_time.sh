#!/bin/sh

# Shows the current date and time

# Date format: "[WeekdayName MonthName YYYY-MM-DD Hour:Min:Sec]"
dwm_date_time () {
    if [ "$USE_EMOJIES" = "true" ]; then
        printf "📆 %s" "$(date "+%a %b %Y-%m-%d %T")"
    else
        printf "D&T %s" "$(date "+%a %b %Y-%m-%d %T")"
    fi
}