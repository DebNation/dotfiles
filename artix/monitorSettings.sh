#!/usr/bin/env bash

# LG UltraGear - Saved Profile

# Brightness (Currently 0)
ddcutil setvcp 10 0

# Contrast (Currently 70)
ddcutil setvcp 12 70

# Video Gain: Red, Green, Blue (Currently 50)
ddcutil setvcp 16 50
ddcutil setvcp 18 50
ddcutil setvcp 1a 50

# Video Black Level: Red, Green, Blue (Currently 50)
ddcutil setvcp 6c 50
ddcutil setvcp 6e 50
ddcutil setvcp 70 50

# Sharpness (Currently 50)
ddcutil setvcp 87 50

# Audio speaker volume (Currently 30)
ddcutil setvcp 62 30
