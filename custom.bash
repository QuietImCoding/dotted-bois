#!/bin/bash

RED="\x1B[31m"
GREEN="\x1B[32m"
RESET="\x1B[0m"

print_stars() {
    printf "\x1B[46m"
    for k in $(seq $((`tput cols` / 2)))
    do 
	printf '*'
    done
    printf '\x1B[0m\n'
}

_test_ping() {
    if [[ $(ping -c 1 $1 2>/dev/null) ]] 
    then
	printf "$GREEN SUCCESSFUL! $RESET\n\n"
    else
	printf "$RED FAILED!$RESET\n\n"
    fi
}

conntest() {
    clear
    GATEWAY="$(netstat -rn -f inet | awk '$1=="default"||$1=="0.0.0.0"{print $2}')"
    print_stars
    echo '***  Beginning Test  ***'
    echo
    echo "Your default gateway is $GATEWAY."
    echo
    printf "Connection to default gateway is"
    _test_ping $GATEWAY
    printf "Remote connection"
    _test_ping 8.8.8.8
    printf "DNS resolution"
    _test_ping 'google.com'
    echo '***  Test Complete  ***'
    print_stars
}


