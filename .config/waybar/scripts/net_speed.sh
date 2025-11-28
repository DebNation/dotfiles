#!/usr/bin/env bash

update() {
    sum=0
    for arg; do
        read -r i < "$arg"
        sum=$(( sum + i ))
    done
    cache="/tmp/${1##*/}"
    if [ -f "$cache" ]; then
        read -r old < "$cache"
    else
        old=0
    fi
    printf "%d\n" "$sum" > "$cache"
    printf "%d\n" $(( sum - old ))
}

# Adjust interface patterns if needed: [ew]* covers eth*, wlp*, etc.
rx=$(update /sys/class/net/[ew]*/statistics/rx_bytes)
tx=$(update /sys/class/net/[ew]*/statistics/tx_bytes)

# Scale and normalize (your original logic)
rx=$(( rx * 10 ))
tx=$(( tx * 10 ))
rx=$(( rx / 16 ))
tx=$(( tx / 16 ))

# Format human-readable
down=$(numfmt --to=si "$rx")
up=$(numfmt --to=si "$tx")

# Output combined line
echo " ${down}  ${up}"
