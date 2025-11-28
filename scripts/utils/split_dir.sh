#!/bin/bash

# Check for source directory argument
if [ -z "$1" ]; then
    echo "Usage: $0 <source_directory>"
    exit 1
fi

src="$1"
d1="first_half"
d2="second_half"

mkdir -p "$d1" "$d2"

# Get directory contents (1 level deep), sorted
mapfile -t items < <(find "$src" -mindepth 1 -maxdepth 1 -printf "%f\n" | sort)

total=${#items[@]}
half=$((total / 2))

echo "Total items: $total"
echo "Copying first $half items to $d1/"
echo "Copying remaining $((total - half)) items to $d2/"

# Copy first half
for i in $(seq 0 $((half - 1))); do
    cp -r "$src/${items[i]}" "$d1/"
done

# Copy second half
for i in $(seq $half $((total - 1))); do
    cp -r "$src/${items[i]}" "$d2/"
done

echo "Done!"
