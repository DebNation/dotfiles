#!/usr/bin/env bash
cliphist list | rofi -dmenu -i -p "Search:" -theme-str 'window { width: 70%; location: center; anchor: center; }' | cliphist decode | wl-copy
