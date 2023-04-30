#!/bin/sh
# Requirement: nmcli

# Show the private ip address(es) 

dwm_private_ip(){
    # read all private IPs (exclude the 127.* ones) and put into a variable called Private_IPs
    readarray -t Private_IPs < <(nmcli | grep "inet4" | grep -v "127" | awk '{print $2}' | sed -r "s/(.*)\/(.*)/\1/g")

    for ip in ${Private_IPs[@]};do
        printf " %s " $ip;
    done
}