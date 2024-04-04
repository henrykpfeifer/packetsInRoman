#!/bin/bash

# Display headers
echo "|   Time   | Count  |    Line    |"
echo "--------------------------------"

# Clear values to show only new packets
nstat IpInReceives >/dev/null 2>&1

# Infinite loop
while true; do

    # Wait for 60 seconds
    sleep 60

    # Determine the number of incoming IP packets in the last 60 seconds
    packetsIn=$(nstat | grep 'IpInReceives' | awk '{print $2}')

    # Display the current time, replacing spaces with underscores
    echo -n "| $(date +"%H:%M:%S" | tr ' ' '_') | "

    # Display the number of packets in decimal format
    printf "%-6s" $packetsIn

    # Result variables
    result=""
    num=$packetsIn

    # Display Roman numerals
    declare -a roman=("M" "CM" "D" "CD" "C" "XC" "L" "XL" "X" "IX" "V" "IV" "I")
    declare -a decim=(1000 900 500 400 100 90 50 40 10 9 5 4 1)

    for ((i = 0; i < ${#decim[@]}; ++i)); do
        while (( num >= ${decim[$i]} )); do
            num=$((num - ${decim[$i]}))
            result+="${roman[$i]}"
        done
    done

    # Draw a Roman numeral for each packet
    echo " | $(printf "%-10s" $result) |"

done
